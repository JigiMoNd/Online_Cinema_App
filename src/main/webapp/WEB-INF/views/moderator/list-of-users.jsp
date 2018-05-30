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
								<img src="user.imageUrl">
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
			}
		},
		mounted() {
			this.getUsers();
		}
	})

</script>