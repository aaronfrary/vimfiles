"HACK to hilight coquille Goals and Infos windows differently

"if version < 600
" syntax clear
"elseif exists("b:current_syntax") && b:current_syntax == "coquille"
" finish
"endif
"
"" Coq is case sensitive.
"syn case match
"
"syn cluster mycoqVernac contains=mycoqHACK,mycoqRequire,mycoqCheck,mycoqEval,mycoqNotation,mycoqTacNotation,mycoqDecl,mycoqThm,mycoqLtacDecl,mycoqDef,mycoqFix,mycoqInd,mycoqRec,mycoqShow
"
"" Various
""syn match   mycoqError             "\S\+"
"syn match   mycoqVernacPunctuation ":=\|\.\|:"
"syn match   mycoqIdent             contained "[_[:alpha:]][_'[:alnum:]]*"
"syn keyword mycoqTopLevel          Declare Type Canonical Structure Cd Coercion Derive Drop Existential
""...
"syn keyword mycoqVernacCmd         Functional Scheme Back Combined
"syn keyword mycoqFeedback          Show About Print
"
"" Modules
"syn region mycoqModule contains=mycoqIdent matchgroup=mycoqTopLevel start="Module" end="\.\_s" end=":="me=e-2 nextgroup=mycoqModVal
"syn region mycoqModVal contains=mycoqIdent start=":=" end="\.\_s"
"
"" Terms
"syn cluster mycoqTerm            contains=mycoqKwd,mycoqTermPunctuation,mycoqKwdMatch,mycoqKwdLet,mycoqKwdParen
"syn region mycoqKwdMatch         contained contains=@mycoqTerm matchgroup=mycoqKwd start="\<match\>" end="\<with\>"
"syn region mycoqKwdLet           contained contains=@mycoqTerm matchgroup=mycoqKwd start="\<let\>"   end=":="
"syn region mycoqKwdParen         contained contains=@mycoqTerm matchgroup=mycoqTermPunctuation start="(" end=")" keepend extend
"syn keyword mycoqKwd             contained else end exists2 fix forall fun if in struct then
"syn match   mycoqKwd             contained "\<where\>"
"syn match   mycoqKwd             contained "\<exists!\?"
"syn match   mycoqKwd             contained "|\|/\\\|\\/\|<->\|\~\|->\|=>\|{\|}\|&\|+\|-\|*\|=\|>\|<\|<="
"syn match mycoqTermPunctuation   contained ":=\|:>\|:\|;\|,\|||\|\[\|\]\|@\|?\|\<_\>"
"
"" Various
"syn region mycoqHACK   contains=@mycoqTerm start="^" end="=====|\n\n"
"syn region mycoqOpaque  matchgroup=mycoqVernacCmd start="\<\%(Opaque\|Transparent\)\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
"syn region mycoqRequire contains=mycoqString matchgroup=mycoqVernacCmd start="\<Require\>\%(\_s\+\%(Export\|Import\)\>\)\?" matchgroup=mycoqVernacPunctuation end="\.\_s"
"syn region mycoqRequire matchgroup=mycoqVernacCmd start="\<Import\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
"syn region mycoqRequire matchgroup=mycoqVernacCmd start="\<Export\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
"syn region mycoqCheck   contains=@mycoqTerm matchgroup=mycoqVernacCmd start="\<Check\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
"syn region mycoqOpaque  matchgroup=mycoqVernacCmd start="\<\%(Opaque\|Transparent\)\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
"syn region mycoqShow       matchgroup=mycoqVernacCmd start="\<Show\_s\+\%(\%(Implicits\|Script\|Tree\|Proof\|Conjectures\|Intros\?\|Existentials\)\>\)\?" end="\.\_s"
"
"" Sections
"syn region mycoqSection contains=mycoqSection,@mycoqVernac matchgroup=mycoqVernacCmd start="\<Section\_s*\z(\S\+\)\_s*\.\_s" end="\<End\_s\+\z1\_s*\.\_s"
"
"" Obligations
"syn region mycoqObligation contains=mycoqIdent   matchgroup=mycoqVernacCmd start="\<\%(\%(\%(Admit\_s\+\)\?Obligations\)\|\%(Obligation\_s\+\d\+\)\|\%(Next\_s\+Obligation\)\|Preterm\)\%(\_s\+of\)\?\>" end="\.\_s"
"syn region mycoqObligation contains=mycoqOblOf   matchgroup=mycoqVernacCmd start="\<Solve\_s\+Obligations\>" end="\.\_s" keepend
"syn region mycoqOblOf      contains=mycoqIdent,mycoqOblUsing matchgroup=mycoqVernacCmd start="\<of\>" end="\.\_s" keepend
"syn region mycoqObligation contains=mycoqOblUsing   matchgroup=mycoqVernacCmd start="\<Solve\_s\+All\_s\+Obligations\>" end="\.\_s" keepend
"syn region mycoqOblUsing   contains=mycoqLtac   matchgroup=mycoqVernacCmd start="\<using\>" end="\.\_s"
"syn region mycoqObligation contains=mycoqOblExpr matchgroup=mycoqVernacCmd start="\<Obligations\_s\+Tactic\>" end="\.\_s" keepend
"syn region mycoqOblExpr    contains=mycoqLtac   matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"
"" Scopes
"syn region mycoqBind    contains=mycoqScope matchgroup=mycoqVernacCmd start="\<Bind\|Delimit\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqArgsScope contains=mycoqScope matchgroup=mycoqVernacCmd start="\<Arguments\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqOpen    contains=mycoqScope matchgroup=mycoqVernacCmd start="\<Open\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqClose   contains=mycoqScope,mycoqLocalScope matchgroup=mycoqVernacCmd start="\<Close\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqScope   contained matchgroup=mycoqVernacCmd start="\<Scope\>" end="\.\_s"
"syn region mycoqLocalScope contained contains=mycoqScope matchgroup=mycoqVernacCmd start="\<Local\>" end="\.\_s"
"
"" Hints
"syn region mycoqHint contains=mycoqHintOption start="\<Hint\>" end="\.\_s" keepend
"syn region mycoqHintOption start="\<\%(Resolve\|Immediate\|Constructors\|Unfold\|Extern\)\>" end="\.\_s"
"
"" Add
"syn region mycoqAdd       contains=mycoqAddOption,mycoqAddOption2 matchgroup=mycoqVernacCmd start="\<Add\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqAddOption         contained contains=mycoqAddPrintingOption matchgroup=mycoqVernacCmd start="\<Printing\>" end="\.\_s"
"syn region mycoqAddPrintingOption contained matchgroup=mycoqVernacCmd start="\<\%(Let\|If\)\>" end="\.\_s"
"syn region mycoqAddOption         contained contains=mycoqAddLegacyOption matchgroup=mycoqVernacCmd start="\<Legacy\>" end="\.\_s"
"syn region mycoqAddLegacyOption   contained contains=mycoqAddRingOption,mycoqAddSemiRingOption matchgroup=mycoqVernacCmd start="\<Abstract\>" end="\.\_s"
"syn region mycoqAddRingOption     contained matchgroup=mycoqVernacCmd start="\<Ring\>" end="\.\_s"
"syn region mycoqAddSemiRingOption contained contains=mycoqAddRingOption matchgroup=mycoqVernacCmd start="\<Semi\>" end="\.\_s"
"syn region mycoqAddLegacyOption   contained matchgroup=mycoqVernacCmd start="\<Field\>" end="\.\_s"
"syn region mycoqAddOption         contained matchgroup=mycoqVernacCmd start="\<Field\>" end="\.\_s"
"syn region mycoqAddOption         contained matchgroup=mycoqVernacCmd start="\<Relation\>" end="\.\_s"
"syn region mycoqAddOption         contained matchgroup=mycoqVernacCmd start="\<Ring\>" end="\.\_s"
"syn region mycoqAddOption         contained matchgroup=mycoqVernacCmd start="\<Setoid\>" end="\.\_s"
"syn region mycoqAddOption         contained matchgroup=mycoqVernacCmd start="\<Morphism\>" end="\.\_s"
"syn region mycoqAddOption         contained contains=mycoqAddOption2 matchgroup=mycoqVernacCmd start="\<Rec\>" end="\.\_s"
"syn region mycoqAddOption2        contained contains=mycoqString matchgroup=mycoqVernacCmd start="\<LoadPath\>" end="\.\_s"
"syn region mycoqAddOption2        contained contains=mycoqAddMLPath matchgroup=mycoqVernacCmd start="\<ML\>" end="\.\_s"
"syn region mycoqAddMLPath         contained contains=mycoqString matchgroup=mycoqVernacCmd start="\<Path\>" end="\.\_s"
"
"" Set
"syn region mycoqSet       contains=mycoqSetOption matchgroup=mycoqVernacCmd start="\<Set\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqSetOption           contained contains=mycoqSetPrintingOption matchgroup=mycoqVernacCmd start="\<Printing\>" end="\.\_s"
"syn region mycoqSetPrintingOption   contained matchgroup=mycoqVernacCmd start="\<\%(Coercions\|All\|Implicit\|Matching\|Notations\|Synth\|Universes\|Wildcard\)\>" end="\.\_s"
"syn region mycoqSetPrintingOption   contained matchgroup=mycoqVernacCmd start="\<\%(Width\|Depth\)\>" end="\.\_s"
"syn region mycoqSetPrintingOption   contained matchgroup=mycoqVernacCmd start="\<Coercion\>" end="\.\_s"
"syn region mycoqSetOption           contained matchgroup=mycoqVernacCmd start="\<\%(Silent\|Virtual\_s\+Machine\)\>" end="\.\_s"
"syn region mycoqSetOption           contained matchgroup=mycoqVernacCmd start="\<Undo\>" end="\.\_s"
"syn region mycoqSetOption           contained matchgroup=mycoqVernacCmd start="\<Hyps\>" end="\.\_s"
"syn region mycoqSetHypsOtion        contained matchgroup=mycoqVernacCmd start="\<Limit\>" end="\.\_s"
"syn region mycoqSetOption           contained contains=mycoqContextOption matchgroup=mycoqVernacCmd start="\<\%(Contextual\|Strict\)\>" end="\.\_s"
"syn region mycoqContextOption       contained matchgroup=mycoqVernacCmd start="\<Implicit\>" end="\.\_s"
"syn region mycoqSetOption           contained contains=mycoqExtractOption matchgroup=mycoqVernacCmd start="\<Extraction\>" end="\.\_s"
"syn region mycoqExtractOption       contained matchgroup=mycoqVernacCmd start="\<\%(AutoInline\|Optimize\)\>" end="\.\_s"
"syn region mycoqSetOption           contained contains=mycoqSetFirstorderOption matchgroup=mycoqVernacCmd start="\<Firstorder\>" end="\.\_s"
"syn region mycoqSetFirstorderOption contained matchgroup=mycoqVernacCmd start="\<Depth\>" end="\.\_s"
"syn region mycoqSetOption           contained contains=mycoqImplicitOption matchgroup=mycoqVernacCmd start="\<Implicit\>" end="\.\_s"
"syn region mycoqImplicitOption      contained matchgroup=mycoqVernacCmd start="\<Arguments\>" end="\.\_s"
"syn region mycoqSetOption           contained contains=mycoqLtacOption matchgroup=mycoqVernacCmd start="\<Ltac\>" end="\.\_s"
"syn region mycoqLtacOption          contained matchgroup=mycoqVernacCmd start="\<Debug\>" end="\.\_s"
"syn region mycoqSetOption           contained contains=mycoqLtacOption matchgroup=mycoqVernacCmd start="\<Transparent\_s\+Obligations\>" end="\.\_s"
"
"" Unset
"syn region mycoqUnset       contains=mycoqUnsetOption matchgroup=mycoqVernacCmd start="\<Unset\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqUnsetOption           contained contains=mycoqUnsetPrintingOption matchgroup=mycoqVernacCmd start="\<Printing\>" end="\.\_s"
"syn region mycoqUnsetPrintingOption   contained matchgroup=mycoqVernacCmd start="\<\%(Coercions\?\|All\|Implicit\|Matching\|Notations\|Synth\|Universes\|Wildcard\|Width\|Depth\)\>" end="\.\_s"
"syn region mycoqUnsetOption           contained matchgroup=mycoqVernacCmd start="\<\%(Silent\|Virtual\_s\+Machine\)\>" end="\.\_s"
"syn region mycoqUnsetOption           contained matchgroup=mycoqVernacCmd start="\<Undo\>" end="\.\_s"
"syn region mycoqUnsetOption           contained matchgroup=mycoqVernacCmd start="\<Hyps\>" end="\.\_s"
"syn region mycoqUnsetHypsOtion        contained matchgroup=mycoqVernacCmd start="\<Limit\>" end="\.\_s"
"syn region mycoqUnsetOption           contained contains=mycoqContextOption matchgroup=mycoqVernacCmd start="\<\%(Contextual\|Strict\)\>" end="\.\_s"
"syn region mycoqContextOption         contained matchgroup=mycoqVernacCmd start="\<Implicit\>" end="\.\_s"
"syn region mycoqUnsetOption           contained contains=mycoqExtractOption matchgroup=mycoqVernacCmd start="\<Extraction\>" end="\.\_s"
"syn region mycoqExtractOption         contained matchgroup=mycoqVernacCmd start="\<\%(AutoInline\|Optimize\)\>" end="\.\_s"
"syn region mycoqUnsetOption           contained contains=mycoqUnsetFirstorderOption matchgroup=mycoqVernacCmd start="\<Firstorder\>" end="\.\_s"
"syn region mycoqUnsetFirstorderOption contained matchgroup=mycoqVernacCmd start="\<Depth\>" end="\.\_s"
"syn region mycoqUnsetOption           contained contains=mycoqImplicitOption matchgroup=mycoqVernacCmd start="\<Implicit\>" end="\.\_s"
"syn region mycoqImplicitOption        contained matchgroup=mycoqVernacCmd start="\<Arguments\>" end="\.\_s"
"syn region mycoqUnsetOption           contained contains=mycoqLtacOption matchgroup=mycoqVernacCmd start="\<Ltac\>" end="\.\_s"
"syn region mycoqLtacOption            contained matchgroup=mycoqVernacCmd start="\<Debug\>" end="\.\_s"
"
"" Eval
"syn region mycoqEval      contains=mycoqEvalTac matchgroup=mycoqVernacCmd start="\<Eval\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqEvalTac   contained contains=mycoqEvalIn matchgroup=mycoqTactic start="\<\%(\%(vm_\)\?compute\|red\|hnf\|simpl\|fold\)\>" end="\.\_s" keepend
"syn region mycoqEvalTac   contained contains=mycoqEvalFlag,mycoqEvalIn matchgroup=mycoqTactic start="\<\%(cbv\|lazy\)\>" end="\.\_s"
"syn keyword mycoqEvalFlag contained beta delta iota zeta
"syn region mycoqEvalFlag  contained start="-\?\[" end="\]"
"syn region mycoqEvalTac   contained contains=@mycoqTerm,mycoqEvalIn matchgroup=mycoqTactic start="\<\%(unfold\|pattern\)\>" end="\.\_s"
"syn region mycoqEvalIn    contained contains=@mycoqTerm matchgroup=mycoqVernacCmd start="in" matchgroup=mycoqVernacPunctuation end="\.\_s"
"
"" Notations
"syn region mycoqNotation     contains=mycoqNotationDef start="\%(\%(\%(\<Reserved\>\_s*\)\?\<Notation\>\)\|\<Infix\>\)\(\_s*\<Local\>\)\?" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqNotationDef       contained contains=mycoqNotationString,mycoqNotationTerm matchgroup=mycoqVernacCmd start="\%(\%(\%(\<Reserved\>\_s*\)\?\<Notation\>\)\|\<Infix\>\)\(\_s*\<Local\>\)\?" end="\.\_s"
"syn region mycoqNotationTerm      contained contains=mycoqNotationExpr matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"syn region mycoqNotationExpr      contained contains=@mycoqTerm,mycoqNotationEndExpr matchgroup=mycoqTermPunctuation start="(" end="\.\_s"
"syn region mycoqNotationEndExpr   contained contains=mycoqNotationFormat,mycoqNotationScope matchgroup=mycoqTermPunctuation start=")" end="\.\_s"
"syn region mycoqNotationExpr      contained contains=@mycoqTerm,mycoqNotationFormat,mycoqNotationScope start="[^[:blank:](]" matchgroup=NONE end="\.\_s"
"syn region mycoqNotationFormat    contained contains=mycoqNotationKwd,mycoqString,mycoqNotationEndFormat matchgroup=mycoqVernacPunctuation start="(" end="\.\_s"
"syn region mycoqNotationEndFormat contained contains=mycoqNotationScope matchgroup=mycoqVernacPunctuation start=")" end="\.\_s"
"syn region mycoqNotationScope     contained matchgroup=mycoqVernacPunctuation start=":" end="\.\_s"
"
"syn match   mycoqNotationKwd contained "at \(next \)\?level"
"syn match   mycoqNotationKwd contained "\(no\|left\|right\) associativity"
"syn match   mycoqNotationKwd contained "only parsing"
"syn match   mycoqNotationKwd contained "(\|,\|)\|:"
"syn keyword mycoqNotationKwd contained ident global bigint format
"
"syn region mycoqNotationString contained start=+"+ skip=+""+ end=+"+ extend
"
"" Tactic notations
"syn region mycoqTacNotation     contains=mycoqTacNotationDef start="\<Tactic\_s\+Notation\>" end="\.\_s" keepend
"syn region mycoqTacNotationDef  contained contains=mycoqNotationString,mycoqTacNotationKwd,mycoqTacNotationTerm matchgroup=mycoqVernacCmd start="Tactic\_s\+Notation" end="\.\_s"
"syn region mycoqTacNotationTerm contained contains=mycoqString,mycoqTactic,mycoqTacticKwd,mycoqLtac,mycoqProofPunctuation matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"
"syn keyword mycoqTacNotationKwd contained ident simple_intropattern hyp reference constr integer int_or_var tactic
"syn match   mycoqTacNotationKwd contained "at level"
"
"" Declarations 
"syn region mycoqDecl       contains=mycoqIdent,mycoqDeclTerm,mycoqDeclBinder matchgroup=mycoqVernacCmd start="\<\%(Axiom\|Conjecture\|Hypothes[ie]s\|Parameters\?\|Variables\?\)\>" matchgroup=mycoqVernacCmd end="\.\_s" keepend
"syn region mycoqDeclBinder contained contains=mycoqIdent,mycoqDeclTerm matchgroup=mycoqVernacPunctuation start="(" end=")" keepend
"syn region mycoqDeclTerm   contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start=":" end=")"
"syn region mycoqDeclTerm   contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start=":" end="\.\_s"
"
"" Theorems
"syn region mycoqThm       contains=mycoqThmName matchgroup=mycoqVernacCmd start="\<\%(Program\_s\+\)\?\%(Theorem\|Lemma\|Example\|Corollary\|Remark\)\>" matchgroup=NONE end="\<\%(Qed\|Defined\|Admitted\|Abort\)\.\_s" keepend
"syn region mycoqThmName   contained contains=mycoqThmTerm,mycoqThmBinder matchgroup=mycoqIdent start="[_[:alpha:]][_'[:alnum:]]*" matchgroup=NONE end="\<\%(Qed\|Defined\|Admitted\|Abort\)\.\_s"
"syn region mycoqThmTerm   contained contains=@mycoqTerm,mycoqProofBody matchgroup=mycoqVernacCmd start=":" matchgroup=NONE end="\<\%(Qed\|Defined\|Admitted\|Abort\)\>"
"syn region mycoqThmBinder contained matchgroup=mycoqVernacPunctuation start="(" end=")" keepend
"
"syn region mycoqGoal      contains=mycoqGoalTerm start="\<Goal\>" matchgroup=NONE end="\<\%(Qed\|Defined\|Admitted\|Abort\)\>" keepend
"syn region mycoqGoalTerm  contained contains=@mycoqTerm,mycoqProofBody matchgroup=mycoqVernacCmd start="Goal" matchgroup=NONE end="\<\%(Qed\|Defined\|Admitted\|Abort\)\>" keepend
"
"" Ltac
"syn region mycoqLtacDecl     contains=mycoqLtacProfile start="\<Ltac\>" end="\.\_s" keepend
"syn region mycoqLtacProfile  contained contains=mycoqLtacIdent,mycoqVernacPunctuation,mycoqLtacContents start="Ltac" end="\.\_s"
"syn region mycoqLtacIdent    contained matchgroup=mycoqVernacCmd start="Ltac" matchgroup=mycoqIdent end="[_[:alpha:]][_'[:alnum:]]*"
"syn region mycoqLtacContents contained contains=mycoqTactic,mycoqTacticKwd,mycoqLtac,mycoqProofPunctuation matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"
"syn keyword mycoqLtac contained do info progress repeat try
"syn keyword mycoqLtac contained abstract constr context end external eval fail first fresh fun goal
"syn keyword mycoqLtac contained idtac in let ltac lazymatch match of rec reverse solve type with
"syn match   mycoqLtac contained "|-\|=>\|||\|\[\|\]\|\<_\>\||"
"
"" Proofs
"syn region mycoqProofBody  contained contains=mycoqProofPunctuation,mycoqTactic,mycoqTacticKwd,mycoqProofComment,mycoqProofKwd,mycoqProofEnder,mycoqProofDelim,mycoqLtac matchgroup=mycoqVernacPunctuation start="\.\s" start="\.$" matchgroup=NONE end="\<\%(Qed\|Defined\|Admitted\|Abort\)\.\_s" end="\<Save\>.*\.\_s" keepend
"syn region mycoqProofDelim contained matchgroup=mycoqProofDelim start="\<Proof\>" matchgroup=mycoqProofDot end="\.\_s"
"syn region mycoqProofEnder contained matchgroup=mycoqProofDelim start="\<\%(Qed\|Defined\)\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
""syn region mycoqProofEnder contained matchgroup=mycoqError start="\<\%(Abort\|Admitted\)\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
"syn region mycoqProofEnder contained contains=mycoqIdent matchgroup=mycoqProofDelim start="\<Save\>" matchgroup=mycoqVernacPunctuation end="\.\_s"
"
"syn keyword mycoqTactic    contained absurd apply assert assumption auto
"syn keyword mycoqTactic    contained case[_eq] change clear[body] cofix cbv compare compute congruence constructor contradiction cut[rewrite]
"syn keyword mycoqTactic    contained decide decompose dependent destruct discriminate double
"syn keyword mycoqTactic    contained eapply eassumption econstructor elim[type] equality evar exact eexact exists
"syn keyword mycoqTactic    contained fix f_equal fold functional generalize hnf
"syn keyword mycoqTactic    contained idtac induction injection instantiate intro[s] intuition inversion[_clear]
"syn keyword mycoqTactic    contained lapply left move omega pattern pose proof quote
"syn keyword mycoqTactic    contained red refine reflexivity rename replace revert rewrite right ring
"syn keyword mycoqTactic    contained set simpl[e] simplify_eq split subst stepl stepr symmetry
"syn keyword mycoqTactic    contained transitivity trivial unfold vm_compute
"syn keyword mycoqTacticKwd contained as by in using with into after until
"
"  " The following is just to help other plugins to detect via syntax groups that we are inside a proof
"syn keyword mycoqProofKwd         contained else end exists exists2 forall fun if in match let struct then where with
"syn match   mycoqProofKwd         contained "|\|/\\\|\\/\|<->\|\~\|->\|=>\|{\|}\|&\|+\|="
"syn match   mycoqProofPunctuation contained "(\|)\|:=\|:>\|:\|\.\|;\|,\|||\|\[\|\]\|@\|?"
"syn region  mycoqProofComment     contained contains=mycoqProofComment,mycoqTodo start="(\*" end="\*)" extend keepend
"
"" Definitions
"syn region mycoqDef          contains=mycoqDefName matchgroup=mycoqVernacCmd start="\<\%(Program\_s\+\)\?\%(Definition\|Let\)\>" matchgroup=mycoqVernacPunctuation end=":="me=e-2 end="\.$"me=e-1 end="\.\s"me=e-2 nextgroup=mycoqDefContents1,mycoqProofBody keepend skipnl skipwhite skipempty
"syn region mycoqDefName       contained contains=mycoqDefBinder,mycoqDefType,mycoqDefContents1 matchgroup=mycoqIdent start="[_[:alpha:]][_'[:alnum:]]*" matchgroup=NONE end="\.\_s" end=":="
"syn region mycoqDefBinder     contained contains=mycoqDefBinderType matchgroup=mycoqVernacPunctuation start="(" end=")" keepend
"syn region mycoqDefBinderType contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start=":" end=")"
"syn region mycoqDefType       contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start=":" matchgroup=NONE end="\.\_s" end=":="
"syn region mycoqDefContents1  contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start=":=" matchgroup=mycoqVernacPunctuation end="\.\_s"
"
"" Fixpoints
"syn region mycoqFix     contains=mycoqFixBody start="\<\%(Program\_s\+\)\?\%(\%(\%(Co\)\?Fixpoint\)\|Fixpoint\|Function\)\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqFixBody       contained contains=mycoqFixName matchgroup=mycoqVernacCmd start="\%(\%(\%(Co\)\?Fixpoint\)\|Function\)" start="\<with\>" matchgroup=NONE end="\.\_s"
"syn region mycoqFixName       contained contains=mycoqFixBinder,mycoqFixAnnot,mycoqFixTerm,mycoqFixContent matchgroup=mycoqIdent start="[_[:alpha:]][_'[:alnum:]]*" matchgroup=NONE end="\.\_s"
"syn region mycoqFixBinder     contained contains=mycoqFixBinderType matchgroup=mycoqVernacPunctuation start="(" end=")" keepend
"syn region mycoqFixBinderType contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start=":" end=")" keepend
"syn region mycoqFixAnnot      contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start="{\_s*struct" end="}" keepend
"syn region mycoqFixTerm       contained contains=@mycoqTerm,mycoqFixContent matchgroup=mycoqVernacPunctuation start=":" end="\.\_s"
"syn region mycoqFixContent    contained contains=mycoqFixBody,@mycoqTerm,mycoqKwdMatch,mycoqFixNot matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"syn region mycoqFixNot        contained contains=mycoqNotationString,mycoqFixNotTerm matchgroup=mycoqVernacCmd start="\<where\>" end="\.\_s"
"syn region mycoqFixNotTerm    contained contains=@mycoqTerm,mycoqFixBody,mycoqFixNotScope matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"syn region mycoqFixNotScope   contained contains=mycoqFixBody matchgroup=mycoqVernacPunctuation start=":" end="\.\_s"
"
""Inductives
"syn region mycoqInd            contains=mycoqIndBody start="\<\%(Co\)\?Inductive\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqIndBody     contained contains=mycoqIdent,mycoqIndTerm,mycoqIndBinder matchgroup=mycoqVernacCmd start="\%(Co\)\?Inductive" start="\<with\>" matchgroup=NONE end="\.\_s"
"syn region mycoqIndBinder      contained contains=mycoqIndBinderTerm matchgroup=mycoqVernacPunctuation start="("  end=")" keepend
"syn region mycoqIndBinderTerm  contained contains=@mycoqTerm matchgroup=mycoqVernacPunctuation start=":" end=")"
"syn region mycoqIndTerm        contained contains=@mycoqTerm,mycoqIndContent matchgroup=mycoqVernacPunctuation start=":" matchgroup=NONE end="\.\_s"
"syn region mycoqIndContent     contained contains=mycoqIndConstructor start=":=" end="\.\_s"
"syn region mycoqIndConstructor contained contains=mycoqConstructor,mycoqIndBinder,mycoqIndConsTerm,mycoqIndNot,mycoqIndBody matchgroup=mycoqVernacPunctuation start=":=\%(\_s*|\)\?" start="|" matchgroup=NONE end="\.\_s"
"syn region mycoqIndConsTerm    contained contains=mycoqIndBody,@mycoqTerm,mycoqIndConstructor,mycoqIndNot matchgroup=mycoqConstructor start=":" matchgroup=NONE end="\.\_s"
"syn region mycoqIndNot         contained contains=mycoqNotationString,mycoqIndNotTerm matchgroup=mycoqVernacCmd start="\<where\>" end="\.\_s"
"syn region mycoqIndNotTerm     contained contains=@mycoqTerm,mycoqIndNotScope,mycoqIndBody matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"syn region mycoqIndNotScope    contained contains=mycoqIndBody matchgroup=mycoqVernacPunctuation start=":" end="\.\_s"
"syn match  mycoqConstructor    contained "[_[:alpha:]][_'[:alnum:]]*"
"
"" Records
"syn region mycoqRec        contains=mycoqRecProfile start="\<Record\>" matchgroup=mycoqVernacPunctuation end="\.\_s" keepend
"syn region mycoqRecProfile contained contains=mycoqIdent,mycoqRecTerm,mycoqRecBinder matchgroup=mycoqVernacCmd start="Record" matchgroup=NONE end="\.\_s"
"syn region mycoqRecBinder  contained contains=@mycoqTerm matchgroup=mycoqTermPunctuation start="("  end=")"
"syn region mycoqRecTerm    contained contains=@mycoqTerm,mycoqRecContent matchgroup=mycoqVernacPunctuation start=":"  end="\.\_s"
"syn region mycoqRecContent contained contains=mycoqConstructor,mycoqRecStart matchgroup=mycoqVernacPunctuation start=":=" end="\.\_s"
"syn region mycoqRecStart   contained contains=mycoqRecField,@mycoqTerm start="{" matchgroup=mycoqVernacPunctuation end="}" keepend
"syn region mycoqRecField   contained contains=mycoqField matchgroup=mycoqVernacPunctuation start="{" end=":"
"syn region mycoqRecField   contained contains=mycoqField matchgroup=mycoqVernacPunctuation start=";" end=":"
"syn match mycoqField       contained "[_[:alpha:]][_'[:alnum:]]*"
"
"" Various (High priority)
"syn region  mycoqComment           containedin=ALL contains=mycoqComment,mycoqTodo start="(\*" end="\*)" extend keepend
"syn keyword mycoqTodo              contained TODO FIXME XXX NOTE
"syn region  mycoqString            start=+"+ skip=+""+ end=+"+ extend
"
"" Synchronization
"syn sync minlines=50
"syn sync maxlines=500
"
"" Define the default highlighting.
"" For version 5.7 and earlier: only when not done already
"" For version 5.8 and later: only when an item doesn't have highlighting yet
"if version >= 508 || !exists("did_mycoq_syntax_inits")
" if version < 508
"  let did_mycoq_syntax_inits = 1
"  command -nargs=+ HiLink hi link <args>
" else
"  command -nargs=+ HiLink hi def link <args>
" endif
"
" " PROOFS
" HiLink mycoqTactic                    Keyword
" HiLink mycoqLtac mycoqTactic
" HiLink mycoqProofKwd mycoqTactic
" HiLink mycoqProofPunctuation mycoqTactic
" HiLink mycoqTacticKwd mycoqTactic
" HiLink mycoqTacNotationKwd mycoqTactic
" HiLink mycoqEvalFlag mycoqTactic
" " Exception
" HiLink mycoqProofDot mycoqVernacular
"
" " PROOF DELIMITERS ("Proof", "Qed", "Defined", "Save")
" HiLink mycoqProofDelim                Underlined
"
" " TERMS AND TYPES
" HiLink mycoqTerm                      Type
" HiLink mycoqKwd             mycoqTerm
" HiLink mycoqTermPunctuation mycoqTerm
"
" " VERNACULAR COMMANDS
" HiLink mycoqVernacular                PreProc
" HiLink mycoqVernacCmd         mycoqVernacular
" HiLink mycoqVernacPunctuation mycoqVernacular
" HiLink mycoqHint              mycoqVernacular
" HiLink mycoqFeedback          mycoqVernacular
" HiLink mycoqTopLevel          mycoqVernacular
"
" " DEFINED OBJECTS
" HiLink mycoqIdent                     Identifier
" HiLink mycoqNotationString mycoqIdent
"
" " CONSTRUCTORS AND FIELDS
" HiLink mycoqConstructor               Keyword
" HiLink mycoqField mycoqConstructor
"
" " NOTATION SPECIFIC ("at level", "format", etc)
" HiLink mycoqNotationKwd               Special
"
" " USUAL VIM HIGHLIGHTINGS
"   " Comments
"   HiLink mycoqComment                   Comment
"   HiLink mycoqProofComment mycoqComment
"
"   " Todo
"   HiLink mycoqTodo                      Todo
"
"   " Errors
"   "HiLink mycoqError                     Normal
"
"   " Strings
"   HiLink mycoqString                    String
"
" delcommand HiLink
"endif

runtime! syntax/ocaml.vim
unlet b:current_syntax


let b:current_syntax = "coquille"
