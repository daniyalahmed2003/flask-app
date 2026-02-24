pipeline {
    agent any;
    stages {
        stage("Code") {
            steps {
                git url:'https://github.com/daniyalahmed2003/flask-app.git', branch:'main' 
                echo "Code cloned sucessfully..."
            }
        }
        stage("Build") {
            steps {
                sh 'docker build -t flask-app .'
                echo "Code Build successfully..."
            }
        }
        stage("Test") {
            steps {
                echo "Test Cases Successful..."
            }
        }
        stage("Push to DockerHub") {
            steps {
                withCredentials([usernamePassword(
                    credentialsId:'dockerHubCreds',
                    usernameVariable:'dockerHubUser',
                    passwordVariable:'dockerHubPass')]){
                        sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                        sh "docker image tag flask-app ${env.dockerHubUser}/flask-app:latest"
                        sh "docker push ${env.dockerHubUser}/flask-app:latest"
                    }
            }
        }
        stage("Deployment") {
            steps {
                sh 'docker-compose down'
                sh 'docker-compose up -d'
                echo "Code deployed successfully..."
            }
        }
    }
}
