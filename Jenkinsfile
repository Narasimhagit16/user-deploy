pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    options {
        timeout(time: 1, unit : 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')

    }
    parameters {
        string(name: 'version', defaultValue: '', description: 'What is the artifact version?')

        string(name: 'environment', defaultValue: 'dev', description: 'What is the environment?')
   
    }

    environment{
        packageVersion=""
        nexusURL="172.31.10.115:8081"
    }
    stages {
        stage('Print variables') {
            steps {
                sh """ 
                echo "version ${params.version}"
                echo "environment ${params.environment}"
                """

                }
            }

        stage('Terraform Init') {
            steps {
                sh """ 
                cd terraform 
                terraform init --backend-config=${params.environment}/backend.tf -reconfigure 
                """

                }
            } 

        stage('Terraform Plan') {
            steps {
                sh """ 
                cd terraform 
                terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                """

                }
            } 
        stage('Terraform apply') {
            steps {
                sh """ 
                cd terraform 
                terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """

                }
            }             

    }
    post { 
        always { 
            echo 'I will always say Hello again Narasimha!'
            deleteDir()
        }
        failure { 
            echo 'Pipeline failed!'
        }
        success { 
            echo 'I will always say when success'
        } 
    }
 }
