<%--
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
 *
 * @author <a href='mailto:limcheekin@vobject.com'>Lim Chee Kin</a>
 *
 * @since 5.0.beta2
 */
 --%>
 
<%@ page import="org.activiti.engine.task.Task" %>
<%@ page import="org.grails.activiti.ActivitiUtils" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="allTasks.title" default="All Tasks"/></title>
        <script type="text/javascript">
        		function confirmDelete() {
        				return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');           		
        				}
        </script>
    </head>
    <body>
        <div class="nav">
    			<g:render template="navigation" />
    		</div>
        <div class="body">
            <h1><g:message code="allTasks.title" default="All Tasks"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'task.id.label', default: 'Id.')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'task.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'task.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="priority" title="${message(code: 'task.priority.label', default: 'Priority')}" />
                        
                            <g:sortableColumn property="assignee" title="${message(code: 'task.assignee.label', default: 'Assignee')}" />
      											<th>Action</th>                                          
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${allTasks}" status="i" var="taskInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: taskInstance, field: "id")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: taskInstance, field: "description")}</td>
                        
                            <td>
							                <g:form action="changePriority">
							                  <g:hiddenField name="taskId" value="${taskInstance.id}" />
							                	<g:select name="priority" from="${[1,2,3,4,5]}" 
							                		onchange="this.form.submit();" value="${taskInstance.priority}"/>	
							                </g:form>                            
                            </td>
                        
                            <td>
								                				<%
																		def userList=[:]
																		def identityService = ActivitiUtils.identityService
																		identityService.findUsersByGroupId("management").each { user ->
																				userList[user.id]="${user.id}, management"
																		}										
																		
																 %>                            
							                <g:form action="setAssignee">
							                  <g:hiddenField name="taskId" value="${taskInstance.id}" />
							                	<g:select name="assignee" from="${userList}" optionKey="key" 
							                		optionValue="value" noSelection="['null': '[Select User]']"
							                		onchange="this.form.submit();" value="${taskInstance.assignee}"/>	
							                </g:form>
                            </td>
                    
                           <td>
                             		<g:form action="deleteTask" onsubmit="return confirmDelete();">
                             				<g:hiddenField name="taskId" value="${taskInstance.id}" />
                             				<span class="button"><g:submitButton style="font-weight:bold" name="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"/></span>                           			
                             		</g:form>                  		
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${allTasksCount}" />
            </div>
        </div>
    </body>
</html>