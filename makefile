IMAGE_NAME=terrassa
APP_NAME=terrassa
IMAGE_PORT=80
HOST_PORT=80
HUGO_SITE=exampleSite

build:
	cd ./$(HUGO_SITE) && hugo
docker:
	docker image build --build-arg HUGO_SITE=$(HUGO_SITE) -t $(IMAGE_NAME) .
docker-nc:
	docker image build --build-arg HUGO_SITE=$(HUGO_SITE) --no-cache -t $(IMAGE_NAME) .
run:
	docker container run -d -p $(IMAGE_PORT):$(HOST_PORT) --name $(APP_NAME) $(IMAGE_NAME)
stop:
	docker container stop $(APP_NAME)
rm:
	docker container rm $(APP_NAME)
clean:
	docker container stop $(APP_NAME) && docker container rm $(APP_NAME) && docker image rm $(IMAGE_NAME) && cd ./$(HUGO_SITE) && rm -rf ./public
