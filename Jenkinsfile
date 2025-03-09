pipeline {
    agent any
    stages {
        // stage('Checkout') {
            // steps {
            //     git 'https://github.com/your-username/jenkins-java-demo.git'
            // }
        // }
        stage('Build') {
            steps {
                sh 'javac Main.java'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying Java app...'
            }
        }
    }
}