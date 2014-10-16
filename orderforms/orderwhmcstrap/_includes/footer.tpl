
	</div>
	
	<!-- RIGHT SIDE -->
	<div class="col-md-4">
		
		{if $showcart}
		<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
			<input type="hidden" name="validatepromo" value="true" />
			{include file="orderforms/$carttpl/_includes/cart.tpl"}
		</form>
		{/if}
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">Host with confidence</h3>
			</div>
			
			<div style="text-align:center;" class="panel-body">
				<img src="/_images/logo.png">				
			</div>
			
			<table style="text-align:center;" class="table table-striped">
				<tbody>
					<tr>
						<td>
							<a class="btn btn-primary btn-block" href="#">Need Help? Ask Support</a>
						</td>
					</tr>
					<tr>
						<td><span class="icon icon-money-2"></span>&nbsp;&nbsp;30 days money back guarantee</td>
					</tr>
					<tr>
						<td><span class="icon icon-shield"></span>&nbsp;&nbsp;Encrypted checkout and payment</td>
					</tr>
					<tr>
						<td><span class="icon icon-upload-1"></span>&nbsp;&nbsp;We’ve got your back with daily back ups!</td>
					</tr>
					<tr>
						<td><span class="icon icon-phone-circled"></span>&nbsp;&nbsp;Phone us for help on <strong>01827 781 311</strong> <small>(9am - 5pm)</small></td>
					</tr>
				</tbody>
			</table>
		
		</div>
	
	</div>

</div>