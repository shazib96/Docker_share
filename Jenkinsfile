/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    stages {
        stage('Code Quality') {
            steps {
                sh 'echo checking code quality'
            }
        }
        stage('Unit Tests') {
            steps {
                sh 'echo Testing the Applications'
            }
        }
        stage('Build') {
            steps {
                sh 'echo Creating application Package'
            }
            steps {
                sh git credentialsId: 'e628b384-d57e-44bf-8cce-273aa79e893d', url: 'https://github.com/shazib96/Docker_share.git'
            }
        }
        stage('Delivery') {
            steps {
                sh 'echo Uploading the artifact to a repository'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo Deploying the Application'
            }
        }
    }
        
}
