restart-mongo:
	docker stop mongo-explain || true
	docker run --rm --name mongo-explain \
		-p 27017:27017 \
		-d mongo:4.4.10

