pipeline {

  agent any
  
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
         sh "mvn clean package"
       }
    }
    stage('Test') {
      steps {
        sh 'echo test'
      }
    }
   
	
    
	}	  
		  

 

}	
		  
