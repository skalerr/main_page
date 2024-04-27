pipeline {
    agent { 
        node {
            label 'docker'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    environment {
        FLUTTER_CHANNEL = 'stable' // Выбор канала Flutter (stable, beta, dev)
        FLUTTER_VERSION = '2.10.0' // Версия Flutter
        DOCKER_VERSION = '20.10.9' // Версия Docker
    }
    stages {
        stage('ENV') {
            steps {
                sh '''
                    wget https://storage.googleapis.com/flutter_infra/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
                    tar xf flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
                    export PATH="$PATH:`pwd`/flutter/bin"
                    flutter doctor -v
                '''
               }
            
        }

        stage('Build for Web') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build web'
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my_flutter_app .'
            }
        }
    }
}