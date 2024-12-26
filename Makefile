ROOT_DIR = $(realpath .)

RELEASE_PARAMS = --release --obfuscate --split-debug-info=$(ROOT_DIR)/obfuscate --dart-define-from-file=.env

install: clean clean_get create_icon pod_install

get:
	@flutter pub get

pod_install:
	@cd ios && rm -rf Podfile.lock && pod install --repo-update --clean-install

clean_get: remove_lock get

clean: remove_lock
	@flutter clean

clean-code:
	@echo "ARE YOU SURE ??? - type \"YES\""
	@read RESP && if [ "$$RESP" != "YES" ]; then exit 1; fi
	rm -rf build
	rm -rf .flutter-plugins
	rm -rf .flutter-plugins-dependencies
	rm -rf pubspec.lock
	rm -rf .dart_tool/flutter_build
	flutter pub cache clean
	flutter clean
	$(MAKE) flush-pods

remove_lock:
	@find . -name "*pubspec.lock" -type f -delete

build_runner:
	@find . -name "*.g.dart" -type f -delete && \
	dart run build_runner build --delete-conflicting-outputs

upgrade: remove_lock
	@flutter pub upgrade

auto_fix: format
	@dart fix --apply

format:
	@dart format --fix .

packages_upgrade:
	@flutter packages upgrade

create_splash:
	@dart run flutter_native_splash:create

create_icon: install
	@dart pub run flutter_launcher_icons

git_clean:
	@echo "Cleaning remote..."
	@git remote prune origin
	@echo "Cleaning local..."
	@git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done

build_appbundle:
	@flutter build appbundle $(RELEASE_PARAMS)

build_ipa:
	@flutter build ipa $(RELEASE_PARAMS)

build_apk_dry: create_splash
	@flutter build apk $(RELEASE_PARAMS)

build_version: install create_splash build_appbundle build_ipa

build_version_dry: build_appbundle build_ipa

# Usage: make feature name={NOME_DA_FEATURE}
feature:
	@lego create $(name) pop

flush-pods:
	pod repo remove trunk
	rm -rf ios/Pods 
	rm -rf ios/Podfile.lock
	flutter pub get
	pod install --project-directory=ios
	sed -I '' -E 's/readlink/readlink -f/g' "ios/Pods/Target Support Files/Pods-Runner/Pods-Runner-frameworks.sh"	