/* Generated By:JJTree: Do not edit this line. ASTExp2.java Version 6.0 */
/* JavaCCOptions:MULTI=true,NODE_USES_PARSER=false,VISITOR=true,TRACK_TOKENS=false,NODE_PREFIX=AST,NODE_EXTENDS=,NODE_FACTORY=,SUPPORT_CLASS_VISIBILITY_PUBLIC=true */
package pilots.compiler.parser;

public
class ASTExp2 extends SimpleNode {
  public ASTExp2(int id) {
    super(id);
  }

  public ASTExp2(PilotsParser p, int id) {
    super(p, id);
  }


  /** Accept the visitor. **/
  public Object jjtAccept(PilotsParserVisitor visitor, Object data) {

    return
    visitor.visit(this, data);
  }
}
/* JavaCC - OriginalChecksum=6e7e594da852bbe6e8a4d5e69aa452a6 (do not edit this line) */
