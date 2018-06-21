<%@ include file="/WEB-INF/taglib.jsp" %>

<div id="app">
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th colspan="8" style="text-align:center">List of users</th></tr>
							<tr>
								<th>ID</th>
								<th>Full name</th>
								<th>E-mail</th>
								<th>Age</th>
								<th>Image</th>
								<th>Role</th>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="user in users" :key="user.id">
								<td style="vertical-align:middle;">
								{{ user.id}}
								</td>
								<td style="vertical-align:middle;">
								{{ user.firstName}} {{user.lastName}}
								</td>
								<td style="vertical-align:middle;">
								{{ user.email}}
								</td>
								<td style="vertical-align:middle;">
								{{ user.age}}
								</td>
								<td style="vertical-align:middle;">
									<img :src="user.imageUrl" width="50px">
								</td>
								<td style="vertical-align:middle;">
									<span v-if="user.role == 'ROLE_ADMIN'">
										<i class="glyphicon glyphicon-king" style="font-size: 15px;">Admin</i> 
									</span>
									<span v-else-if ="user.role == 'ROLE_MODERATOR'">
										<i class="glyphicon glyphicon-queen" style="font-size: 15px;">Moderator</i>
									</span>
									<span v-else-if="user.role == 'ROLE_USER'">
										<i class="glyphicon glyphicon-bishop" style="font-size: 15px;">User</i>
									</span>
									<span v-else-if="user.role == 'ROLE_UNCONFIRMED'">
										<i class="glyphicon glyphicon-pawn" style="font-size: 15px;">Unconfirmed</i> 
									 </span>
								</td>
								<td style="vertical-align:middle; width:20%" >
									<sec:authorize access="hasRole('ADMIN')">
										<span v-if="user.role == 'ROLE_ADMIN'">
											<button @click="changeRoleUser(user)" class="btn btn-primary" style=width:100%>Change role to "User" </button> <br>
											<button @click="changeRoleModerator(user)" class="btn btn-primary" style=width:100%> Change role to "Moderator" </button> <br>
										</span>
										<span v-else-if ="user.role == 'ROLE_MODERATOR'">
											<button @click="changeRoleUser(user)" class="btn btn-primary" style=width:100%> Change role to "User" </button> <br>
											<button @click="changeRoleAdmin(user)" class="btn btn-primary" style=width:100%> Change role to "Admin"</button> <br>
										</span>
										<span v-else-if="user.role == 'ROLE_USER'">
											<button @click="changeRoleAdmin(user)" class="btn btn-primary" style=width:100%>Change role to "Admin" </button> <br>
											<button @click="changeRoleModerator(user)" class="btn btn-primary" style=width:100%>Change role to "Moderator" </button> <br>
										</span>
										<span v-else-if="user.role == 'ROLE_UNCONFIRMED'">
											<button @click="changeRoleUser(user)" class="btn btn-primary" style=width:100%> Change role to "User" </button> <br>
											<button @click="changeRoleModerator(user)" class="btn btn-primary" style=width:100%>Change role to "Moderator" </button> <br>
											<button @click="changeRoleAdmin(user)" class="btn btn-primary" style=width:100%> Change role to "Admin" </button> <br>
										 </span>
									</sec:authorize>
								</td>
								<td style="vertical-align:middle;">
									<div class="btn-group">
										<button class="btn btn-danger" type="button" @click="deleteUser(user)">
											<i class="glyphicon glyphicon-remove-circle"></i> Delete 
										</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>	
	</div>
</div>

<script>
	new Vue({
		el: '#app',
		data: {
			rootUrl: 'http://localhost:8080/api',
			users: []
		},
		methods: {
			getUsers() {
				var self = this;
				axios.get(this.rootUrl + "/list/users")
				.then(function(serverResponse){
					//console.log(serverResponse.data)
					self.users = serverResponse.data;
				}).catch(function(error) {
					console.log(error);
				})
					
			},
			deleteUser: function(user) {
				axios.get(this.rootUrl + "/delete/" + user.id)
				.then(function(resp) {
					console.log(resp);
					location.reload();
				}).catch(function(error) {
					console.log(error);
				})
			},
			changeRoleUser: function(user) {
				axios.get(this.rootUrl + "/change-to-user/" + user.id)
				.then(function(resp) {
					console.log(resp);
					location.reload();
				}).catch(function(error) {
					console.log(error);
				})
			},
			changeRoleAdmin: function(user) {
				axios.get(this.rootUrl + "/change-to-admin/" + user.id)
				.then(function(resp) {
					console.log(resp);
					location.reload();
				}).catch(function(error) {
					console.log(error);
				})
			},
			changeRoleModerator: function(user) {
				axios.get(this.rootUrl + "/change-to-moderator/" + user.id)
				.then(function(resp) {
					console.log(resp);
					location.reload();
				}).catch(function(error) {
					console.log(error);
				})
			}
		},
		mounted() {
			this.getUsers();
		}
	})

</script>