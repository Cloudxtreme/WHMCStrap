<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">Provide Feedback <em>(Optional)</em></h3>
	</div>

	<div class="panel-body">
		
		<table width="100%" cellpadding="2">
		{if $securityquestions && !$loggedin}
		<tr><td width="200">{$LANG.clientareasecurityquestion}</td><td><select name="securityqid">
		{foreach key=num item=question from=$securityquestions}
			<option value={$question.id}>{$question.question}</option>
		{/foreach}
		</select></td></tr>
		<tr><td>{$LANG.clientareasecurityanswer}</td><td><input type="password" name="securityqans" size="30"></td></tr>
		{/if}
		</table>

		{foreach key=num item=customfield from=$customfields}
		<div class="form-group">
			<label>{$customfield.name}</label>
			{$customfield.input|replace:'textarea':'textarea class="form-control"'|replace:'input':'input class="form-control"'|replace:'style="width:90%;"':''} {$customfield.description}
		</div>
		{/foreach}

	</div>

</div>