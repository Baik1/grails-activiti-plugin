/* Copyright 2010 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
  /**
 *
 * @author <a href='mailto:limcheekin@vobject.com'>Lim Chee Kin</a>
 *
 * @since 5.0.beta2
 */
 
includeTargets << grailsScript("Init")

target(install: "Install Vacation Request Sample Application") {
		String vacationRequestDir="${activitiPluginDir}/src/sample-app/vacation-request"
		ant.copy (todir:"${basedir}/grails-app/conf") {
			fileset dir:"${vacationRequestDir}/grails-app/conf"
		}
		ant.copy (todir:"${basedir}/grails-app/controllers") {
			fileset dir:"${vacationRequestDir}/grails-app/controllers"
		}		
		ant.copy (todir:"${basedir}/grails-app/domain") {
			fileset dir:"${vacationRequestDir}/grails-app/domain"
		}	
		ant.copy (todir:"${basedir}/grails-app/views") {
			fileset dir:"${vacationRequestDir}/grails-app/views"
		}						
		ant.copy (todir:"${basedir}/src/groovy") {
			fileset dir:"${vacationRequestDir}/src/groovy"
		}					
}

setDefaultTarget(install)