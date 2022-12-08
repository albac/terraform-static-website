# Terraform using docker

1. Build Docker

```
$ docker build --rm -t terraform-static-website .
```

2. Test docker run:

```
docker run -e TF_VAR_zone_id=XXXXXXXXXXXX -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN -e TF_VAR_backend_bucket=alfredo-terraform-backend -e TF_VAR_role_arn=arn:aws:iam::xxxx:role/xxxx -e TF_VAR_session_name=alfredo_testabc terraform-static-website
```
