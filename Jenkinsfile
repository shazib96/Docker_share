/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    stages {
        stage('git chechkout') {
            steps {
                /* groovylint-disable-next-line LineLength */
                git credentialsId: 'edd0aff5-4f7f-4892-af21-91ffd26d012d', url: 'https://github.com/shazib96/Docker_share.git'
            }
        }
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
        }
        stage('Delivery') {
            steps {
                sh 'echo Uploading the artifact to a repository'
            }
        }
        stage('Deploy') {
            steps {
                sh './image.sh'
            }
        }
    }
      post {
         always {
           cleanWs()
         }
      }
}
