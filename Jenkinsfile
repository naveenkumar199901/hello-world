pipeline {
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
    stage('Build Docker Image') {
      steps {
        sh 'echo Docker'
      }
    }
 
    stage('Test') {
      steps {
        sh 'echo test'
      }
    }
     stage('Deployee') {
      steps {
        sh 'echo Deployee'
      }
    }
	
    
	}	  
		  
post {
			always {
				 echo 'This will always run'  
				 
				emailext body: 'Please find', subject: 'Build And Deployment', to: 'naveenkumar199901@gmail.com'
            
			}
	    
		  
	}

 

}	
		  
