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
                sh 'https://github.com/shazib96/Docker_share.git'
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
