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
                sh "docker build -t todo ."
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
        stage("test"){
            steps{
                echo "========Testing========"
                sh "docker images | grep todo"
            }
            post{
                success{
                    echo "========Testing successfully========"
                }
                failure{
                    echo "========Testing failed========"
                }
            }
        }
        stage("deploy"){
            steps{
                echo "========Deploying========"
                sh "docker rm -f todo-app || true" 
                sh "docker run --name todo-app -p 80:80 -d todo"
                sh "docker ps | grep todo-app"
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