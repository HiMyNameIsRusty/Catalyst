docker build -f ./dev.dockerfile -t catalystdev .
docker run -it -v $(pwd):/root catalystdev
