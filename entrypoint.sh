#!/bin/sh
terraform --version
rm -f tfplan
terraform init \
        -backend-config="bucket=${TF_VAR_backend_bucket}"

terraform plan -no-color -detailed-exitcode -lock=false -out=tfplan -input=false
exit_code=$?
echo "EXIT CODE: $exit_code"
if [ $exit_code != 0 ]
then
        if [ $exit_code != 2 ]
        then
                echo "plan failed"
                exit 1
        fi
        terraform apply -no-color -lock=false -input=false "tfplan"
        if [ $? != 0 ]
        then
                echo "Terraform Applied failed"
                echo "========================"
                exit 1
        fi
        echo "Terraform apply completed"
fi
terraform state show aws_cloudfront_distribution.cf_dist
