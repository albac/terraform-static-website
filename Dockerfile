FROM hashicorp/terraform:latest

ENV TF_VAR_domain=albac.dev
ENV TF_VAR_environment=staticdev
ENV TF_VAR_role_arn=test
ENV TF_VAR_session_name=test
ENV TF_VAR_zone_id=test

COPY *.tf .
COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
