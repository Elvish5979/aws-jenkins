pipeline {
    agent any

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'stage', 'prod'], description: 'Select environment to deploy')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_key')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_VERSION            = '1.4.0'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Elvish5979/aws-jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    sh "terraform init"
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    sh "terraform validate"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    sh "terraform plan -out=tfplan"
                    archiveArtifacts artifacts: "environments/${params.ENVIRONMENT}/tfplan"
                }
            }
        }

        stage('Approval') {
            when {
                expression { params.ENVIRONMENT == 'prod' } // only ask for approval in prod
            }
            steps {
                input message: "Approve Terraform Apply for ${params.ENVIRONMENT}?", ok: "Deploy"
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("environments/${params.ENVIRONMENT}") {
                    sh "terraform apply -auto-approve tfplan"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}