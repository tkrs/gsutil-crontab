# gsutil-crontab

[![Docker Repository on Quay](https://quay.io/repository/tkrs/gsutil-crontab/status "Docker Repository on Quay")](https://quay.io/repository/tkrs/gsutil-crontab)

## Usage

This container accepts arbitrary subcommands for `gsutil`. Execution flow of the container is as follows:

1. Checks if an environment variable `DOWNLOAD_DIR` is declared and the directory doesn't exist, then create the directory.
2. If the environment variable `SOURCE_PATH` is declared and not empty, then run `gsutil cp ${SOURCE_PATH} ${DOWNLOAD_DIR}`; otherwise pass all arguments to the `gsutil` command. This process is provided for backward compatibility and will be deprecated in the near future.
3. Run crond in the foreground.

For example, if you want to run `gsutil mv gs://example/foo/bar gs://example/foo/buzz`, run as follows:

```
$ docker run tkrs/gsutil-crontab mv gs://example/foo/bar gs://example/foo/buzz
```

If you want to run this container in a Kubernetes' Pod, give the instructions via the Pod's definition:

```yaml
containers:
- name: gsutil
  image: quay.io/tkrs/gsutil-crontab
  args:
  - mv
  - gs://example/foo/bar
  - gs://example/foo/buzz
```
