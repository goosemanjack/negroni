﻿/* *********************************************************************
   Copyright 2009-2010 MySpace

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
********************************************************************* */

using System;
using System.Collections.Generic;

using System.Text;
using Negroni.OpenSocial.EL.Elements;

namespace Negroni.OpenSocial.EL.Operators
{
	public class OrOperator : BinaryOperator
	{
		private static readonly OrOperator instance = new OrOperator();

		private OrOperator()
			: base(OperatorType.Or, AssignmentEnum.Left, 40)
		{
		}
		
		public static OrOperator Instance{
			get{return instance;}
		}

		public override IElementValue Apply(IElementValue left, IElementValue right)
		{
			TokenType leftType = left.Type;
			TokenType rightType = right.Type;

			switch (leftType)
			{
				case TokenType.BooleanLiteral:
					break;
				default:
					throw new ELOperationException("Invalid operator type Only Decimal Integer or Strings are allowed");
			}
			switch (rightType)
			{
				case TokenType.BooleanLiteral:
					break;
				default:
					throw new ELOperationException("Invalid operator type Only Booleans are allowed");
			}

			if (((bool)left.Value) || ((bool)right.Value))
			{
				return ElementLiteral.TrueInstance;
			}
			return ElementLiteral.FalseInstance;
		}
	}
}
