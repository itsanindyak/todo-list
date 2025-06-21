pipeline{
    agent{
        label "ak"
    }
    stages{
        stage("clone"){
            steps{
                echo "========Cloning========"
                git url:"https://github.com/itsanindyak/todo-list.git",branch:"main"
            }
            post{
                success{
                    echo "========Cloning successfully========"
                }
                failure{
                    echo "========Cloning failed========"
                }
            }
        }
        stage("build"){
            steps{
                echo "========Building========"
                sh "docker build -t todo-app:latest ."
            }
            post{
                success{
                    echo "========Building successfully========"
                }
                failure{
                    echo "========Building failed========"
                }
            }
        }
        stage("push to docker hub"){
            steps{
                echo "========push image to docker hub========"
                withCredentials([usernamePassword(
                    'credentialsId':"dockerHubCred",
                    passwordVariable:'dockerHubPass',
                    usernameVariable:"dockerHubUser")])
                {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker image tag todo-app:latest ${env.dockerHubUser}/todo-app:latest"
                    sh "docker push ${env.dockerHubUser}/todo-app:latest"
                }

            }
            post{
                success{
                    echo "========Push image to docker hub successfully========"
                }
                failure{
                    echo "========Push image to docker hub failed========"
                }
            }
        }
        
        stage("deploy"){
            steps{
                echo "========Deploying========"
                sh "docker compose down || true"
                sh "docker compose up -d"
            }
        }
    }
    post{
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}