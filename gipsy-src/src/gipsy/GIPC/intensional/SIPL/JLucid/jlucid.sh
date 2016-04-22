#!/bin/bash

strDate=`date`

cat <<GRAMMAR_TAIL
/*
 * Generated by jlucid.sh on $strDate
 */

/**
 * @since $strDate
 */
void embed() #EMBED : {}
{
	//<EMBED> <LPAREN> url() E() ( <COMMA> E() )* <RPAREN> <SEMICOLON>
	<EMBED> <LPAREN> url() <COMMA> <STRING_LITERAL> ( <COMMA> E() )* <RPAREN> <SEMICOLON>
}

/**
 * @since $strDate
 */
void array() #ARRAY : {}
{
	<LBRACKET> E() ( <COMMA> E() )* <RBRACKET>
}

/**
 * URL -> CHARACTER_LITERAL | STRING_LITERAL.
 * @since $strDate
 */
void url() #URL :
{
	Token oToken;
}
{
	(
		  oToken = <CHARACTER_LITERAL>
		| oToken = <STRING_LITERAL>
	)
	{
		jjtThis.setImage(oToken.image);
	}
}

// EOF
GRAMMAR_TAIL

# EOF
