<table width="100%">
	<tr>
		<td align="left">
		<form action='<?php echo $_SERVER['REQUEST_URI']?>' method='post'>
			<input type='hidden' name='title' value='Ответьте на вопрос'>
			<input type='submit' value='Начать тест'>
			<input type='hidden' name='q' value='<?= ++$q?>'>
		</form>
		</td>
	</tr>
</table>