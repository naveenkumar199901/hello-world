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
    stage('Build') {
     
       steps {
         sh "mvn clean install package"
       }
    
    }
	  
	 //stage('Upload_to_S3') {
	//	steps {
         //   withAWS(region:'us-west-2',credentials:'S3UploadCredentitals') {
         //    s3Upload(bucket: 's2-artifact-naveem', workingDir:'.');
          //  }
	//	}	
            
        //  }  
    stage('Build Docker Image') {
      steps {
       sh "docker build -t naveenkumar199901/simple-devops-image:latest -f Dockerfile ."
       sh "docker run -p 8085:8080 -d naveenkumar199901/simple-devops-image:latest"
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
				 
				emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
            
			}
	    
		  
	}

 

}	
		  
