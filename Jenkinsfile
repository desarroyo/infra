pipeline{
    agent any
    parameters{
        string(name: 'ARTIFACT_ID', description: "Name artifact")
    }
    options{
        timeout(time: 15, unit: 'MINUTES')
    }
    stages {
        stage('Build Packer') {
            steps {
                sh 'chmod +x ./bash/build.sh'
                sh './bash/build.sh'
            }
        }        
    }
    stages {
        stage('Run Terraform') {
            steps {
                sh 'chmod +x ./bash/terraform.sh'
                sh './bash/terraform.sh'
            }
        }        
    }
}