<table width="100%" cellspacing="0" cellpadding="0" class="tabForm">
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				
				<tr>
					<td class="dataLabel" style="text-align:center;">						
						<form name="iframe_frm" id="iframe_frm" method="POST" action="index.php" onSubmit="return (add_checks(document.iframe_frm) && check_form('iframe_frm'));">
						<input type='hidden' name='action' value='SaveConfig'/>
						<input type='hidden' name='module' value='Iframeapp'/>						
						
						<span class='error'>{$error.main}</span>
						{if $IFRAME_URL==''}
							{$MOD.LBL_URL_UPDATE}&nbsp;
							<input type='hidden' id='update_url' name='update_url' value='1'/>
							<input type="text" name="iframe_url" value="{$IFRAME_URL}" size="70">&nbsp;
						{else}
						<a href="javascript:show_urlupdate();">{$MOD.LBL_URL}</a>&nbsp;
						<input type='hidden' id='update_url' name='update_url' value='0'/>
						<span id="url_container" style="display:none;"><input type="text" name="iframe_url" value="" size="70"></span>&nbsp;
						{/if}
						{$MOD.LBL_HEIGHT_ADJUST}&nbsp;						
						<input type="text" name="iframe_height" value="{$IFRAME_HEIGHT}" size="10">&nbsp;
						<input type="submit" name="sbt-save" value="  {$APP.LBL_SAVE_BUTTON_LABEL}  ">						
						</form>
					</td>
				</tr>
				
				<tr>
					<td height="100%">
						<iframe name="iframe_iframeapp" width="100%" height="{$IFRAME_HEIGHT}px" frameborder=0 src="{$IFRAME_SRC}"></iframe>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
</table>
{literal}
<script>
	function show_urlupdate(){
		document.getElementById('update_url').value=1
		document.getElementById('iframe_frm').submit();
	}
</script>
{/literal}