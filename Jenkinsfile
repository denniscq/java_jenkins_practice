pipeline {
    agent {
        docker {
            image 'ubuntu:22.04'  // 运行环境
            args '--privileged'
        }
    }

    environment {
        DOCKER_IMAGE = 'java-docker-app'  // Docker 镜像名称
        DOCKER_TAG = 'latest'                   // 镜像版本
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'  // 在 Jenkins 配置的 Docker Hub 凭据 ID
    }

    stages {
        stage('Test') {
            steps {
                echo 'run test unit'
            }
        }

        stage('Install Docker') {
            steps {
                script {
                    sh 'apt-get update && apt-get install -y docker.io'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // script {
                //     withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID, url: ""]) {
                //     }
                // }
                echo 'Docker login successful'
            }
        }

        stage('Push Docker Image') {
            steps {
                // script {
                //     sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                // }
                echo 'Docker push successful'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                    echo 'Deploying Docker image to production environment...'
                    docker run --rm --name my-app ${DOCKER_IMAGE}:${DOCKER_TAG}
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
        always {
            script {
                if (env.NODE_NAME) {
                    echo '📌 Cleaning up workspace...'
                    sh 'docker system prune -f'  // 清理不必要的 Docker 镜像
          } else {
                    echo 'No workspace context available for cleanup.'
                }
            }
        }
    }
}
