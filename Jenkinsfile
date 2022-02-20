pipeline {
  environment {
    imagename = "ganeshmborkar/devops_cicd"
    registryCredential = 'gani_docker_login'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/GaneshMBorkar/devops_cicd', branch: 'master', credentialsId: 'b01f7e5a-fa56-486d-919c-757abbcb4c28'])

      }
    }
    stage('Building image for hub') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Building image') {
      steps{
        script {
        sh "chmod +x -R ${env.WORKSPACE}"
        sh './docker_build.sh'
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}
