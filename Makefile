NAME = adguard-home
DOCKER_HUB_USERNAME = neuressence
VERSION := 0.92-hotfix1

ifdef DOCKER_HUB_USERNAME
IMAGE_NAME = ${DOCKER_HUB_USERNAME}/${NAME}
else
IMAGE_NAME = ${NAME}
endif

REMOTE_FILE = AdGuardHome_v${VERSION}_linux_amd64.tar.gz

test:
	@echo ${IMAGE_NAME}

build:
	wget -c https://github.com/AdguardTeam/AdGuardHome/releases/download/v${VERSION}/${REMOTE_FILE}
	tar xzvf ${REMOTE_FILE}
	docker build -t ${IMAGE_NAME}:latest .	

fresh_build:
	docker build --no-cache t ${IMAGE_NAME}:latest .

run: build
	docker run --rm -ti ${IMAGE_NAME}:latest

shell: build
	docker run --rm -ti ${IMAGE_NAME}:latest bash

attach:
	docker exec -ti `docker ps | grep '${IMAGE_NAME}:latest' | awk '{ print $$1 }'` bash

push: build
	docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:latest && docker push ${IMAGE_NAME}:latest
