pipeline {
environment {
    registry = "naveenkumar199910/test"
    registryCredential = ‘Docker-hub’
}
   agent any
   tools {
    maven 'M2_HOME'
  }
  stages {
    stage('Clonning Git') {
         steps {
            
            checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'Linux@02', url: 'https://github.com/naveenkumar199901/hello-world.git']]]
		timestamps {
           
			}
			
         }
	
		}
    stage('PackageApplication') {
       steps {
         sh "mvn clean install package"
       }
    }

  stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Test') {
      steps {
        sh 'echo test'
      }
    }
   
	
    
	}	  
		  

 

}	
		  
