# Integration Tests

To verify that `lvssh2` works as expected, integration testing is necessary. Integration tests run against an SSH server hosted in a Docker container. The build pipeline runs the integration tests automatically.

To run the integration tests locally, follow the instructions below.

## Prerequisites

- Docker
- Docker Compose

## Running the Integration Tests

1. Start the SSH server in a Docker container:

```sh
cd docker
docker-compose up -d
```

2. Run the integration tests using LVUnit (run all tests in the project)

> [!NOTE]
> Integration tests can softlock LabVIEW when a failure occurs. Make sure to save your work before running the tests. If LabVIEW becomes unresponsive, force close it and restart.