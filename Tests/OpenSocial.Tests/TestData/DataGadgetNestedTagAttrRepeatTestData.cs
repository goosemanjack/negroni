﻿using System;
using System.Collections.Generic;
using System.Text;
using Negroni.OpenSocial.Tests.Helpers;

using Negroni.OpenSocial.Tests.OSML;

using Negroni.OpenSocial.Tests.Controls;

namespace Negroni.OpenSocial.Tests.TestData
{
	public class DataGadgetNestedTagAttrRepeatTestData : DataGadgetTestData
	{
		public DataGadgetNestedTagAttrRepeatTestData()
			: base()
		{
			this.Source =
@"<?xml version='1.0' encoding='utf-8'?>
<Module>
	<Content type='html' view='canvas'>
  <script type=""text/os-data"">
    <os:ViewerRequest key='vwr' />
    <os:PeopleRequest key='myfriends' userid=""@viewer"" groupid=""@friends"" />
  </script>
<script type='text/os-template'>
<h1>User: ${vwr.displayName}</h1>
<div>
<div repeat=""${Top.myfriends}"">dude is: ${Cur.displayName}</div>
</div>
</script>
</Content>
</Module>";

			ExpectedCanvas =
@"<h1>User: Tom</h1>
<div>
<div>dude is: tom</div>
<div>dude is: dick</div>
<div>dude is: harry</div>
</div>";



		}

	}
}
