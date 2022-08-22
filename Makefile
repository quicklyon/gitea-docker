export APP_NAME=gitea
export BUILD_DATE := $(shell date +'%Y%m%d')
export VERSION := $(shell cat VERSION)
export TAG := $(VERSION)-$(BUILD_DATE)

help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## 构建镜像
	docker build --build-arg VERSION=$(VERSION) --build-arg IS_CHINA="true" -t hub.qucheng.com/app/$(APP_NAME):$(TAG) -f Dockerfile .

build-public: ## 国外构建镜像
	docker build --build-arg VERSION=$(VERSION) --build-arg IS_CHINA="false" -t hub.qucheng.com/app/$(APP_NAME):$(TAG) -f Dockerfile .

push: ## push 镜像到 hub.qucheng.com
	docker push hub.qucheng.com/app/$(APP_NAME):$(TAG)

push-public: ## push 镜像到 hub.docker.com
	docker tag hub.qucheng.com/app/$(APP_NAME):$(TAG) easysoft/$(APP_NAME):$(TAG)
	docker tag easysoft/$(APP_NAME):$(TAG) easysoft/$(APP_NAME):latest
	docker push easysoft/$(APP_NAME):$(TAG)
	docker push easysoft/$(APP_NAME):latest

push-sync-tcr: push-public ## 同步到腾讯镜像仓库
	curl http://i.haogs.cn:3839/sync?image=easysoft/$(APP_NAME):$(TAG)
	curl http://i.haogs.cn:3839/sync?image=easysoft/$(APP_NAME):latest

run: ## 运行
	export TAG=$(TAG) ;docker-compose -f docker-compose.yml up -d

smoke-test: ## 冒烟测试新版
	hack/make-rules/smoke-test.sh "gitea" "run"

ps: ## 运行状态
	docker-compose -f docker-compose.yml ps

stop: ## 停服务
	docker-compose -f docker-compose.yml stop
	docker-compose -f docker-compose.yml rm -f

restart: build clean ps ## 重构

clean: stop ## 停服务
	docker-compose -f docker-compose.yml down
	docker volume prune -f

logs: ## 查看运行日志
	docker-compose -f docker-compose.yml logs
