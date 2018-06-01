<%@ include file="/WEB-INF/taglib.jsp" %>
<div id="app">
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover table-striped">
						<tbody>
							<tr v-for="user in users" :key="user.id">
								<td>
								{{ user.id}}
								</td>
								
									<td>
										<sec:authorize access="hasRole('MODERATOR')">
											<span v-if="user.role == 'ROLE_ADMIN'">
												<a href="#"> <i class="glyphicon glyphicon-king" style="font-size: 25px;"></i> Admin</a>
											</span>
											<span v-else-if ="user.role == 'ROLE_MODERATOR'">
												<a href="#"> <i class="glyphicon glyphicon-queen" style="font-size: 25px;"></i> Moderator</a>
											</span>
											<span v-else-if="user.role == 'ROLE_USER'">
												<a href="#"> <i class="glyphicon glyphicon-bishop" style="font-size: 25px;"></i> User</a>
											</span>
											<span v-else-if="user.role == 'ROLE_UNCONFIRMED'">
												<a href="#"> <i class="glyphicon glyphicon-pawn" style="font-size: 25px;"></i> Unconfirmed</a>
											 </span>
										</sec:authorize>
										
										<sec:authorize access="hasRole('ADMIN')">
											<span v-if="user.role == 'ROLE_ADMIN'">
												<button @click="changeUserRole(user)" class="btn btn-primary"> <i class="glyphicon glyphicon-king" style="font-size: 25px;"></i> Admin</button>
											</span>
											<span v-else-if ="user.role == 'ROLE_MODERATOR'">
												<button @click="changeUserRole(user)" class="btn btn-primary"> <i class="glyphicon glyphicon-queen" style="font-size: 25px;"></i> Moderator</button>
											</span>
											<span v-else-if="user.role == 'ROLE_USER'">
												<button @click="changeUserRole(user)" class="btn btn-primary"> <i class="glyphicon glyphicon-bishop" style="font-size: 25px;"></i> User</button>
											</span>
											<span v-else-if="user.role == 'ROLE_UNCONFIRMED'">
												<button @click="changeUserRole(user)" class="btn btn-primary"> <i class="glyphicon glyphicon-pawn" style="font-size: 25px;"></i> Unconfirmed</button>
											 </span>
										</sec:authorize>
									</td>
								<td>
								{{ user.firstName}} {{user.lastName}}
								</td>
								<td>
								{{ user.email}}
								</td>
								<td>
								{{ user.age}}
								</td>
								<td>
									<div class="btn-group">
										<button class="btn btn-danger" type="button" @click="deleteUser(user)">
											<i class="glyphicon glyphicon-remove-circle"></i> Delete 
										</button>
									</div>
								</td>
								<td>
								<img :src="user.imageUrl" width="50px">
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
			changeUserRole: function(user) {
				axios.get(this.rootUrl + "/change-role/" + user.id)
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