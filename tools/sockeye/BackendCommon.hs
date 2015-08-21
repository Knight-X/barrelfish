{- 
   BackendCommon: Common code used by most backends
   
  Part of Flounder: a message passing IDL for Barrelfish
   
  Copyright (c) 2007-2010, ETH Zurich.
  All rights reserved.
  
  This file is distributed under the terms in the attached LICENSE file.
  If you do not find this file, copies can be found by writing to:
  ETH Zurich D-INFK, Universit\"atstr. 6, CH-8092 Zurich. Attn: Systems Group.
-}  



module BackendCommon where


import qualified CAbsSyntax as C
import SockeyeSyntax
import Data.Char (toUpper, isAlpha)


------------------------------------------------------------------------
-- Language mapping: C identifier names
------------------------------------------------------------------------

-- Scope a list of strings
ifscope :: String -> String -> String
ifscope sn s = sn ++ "_" ++ s

idscope :: String -> String -> String -> String
idscope sn s suffix  = ifscope sn (s ++ "__" ++ suffix)

drvscope :: String -> String -> String -> String
drvscope drv sn s = ifscope sn (drv ++ "_" ++ s)

fact_add_fn :: String -> String
fact_add_fn sn = sn ++ "add"

fact_exist_fn :: String -> String
fact_exist_fn sn = sn ++ "exist"

fact_remove_fn :: String -> String
fact_remove_fn sn = sn ++ "remove"

-- Name of the type of a message function
fact_sig_type :: String -> String-> FactDef -> String
fact_sig_type sn fn f@(Fact _ _ _) = (idscope sn (fact_name f)) fn

-- Name of the fact attributes struct
fact_attrib_type :: String -> FactDef -> String
fact_attrib_type sn f@(Fact _ _ _) = ifscope sn (fact_name f)

fact_param_desc :: FactAttribute -> String
fact_param_desc fa = "@param  " ++ pname ++ "   " ++ pdesc 
  where 
    pname = fact_args_name fa
    pdesc = fact_args_desc fa

-- Name of a given message definition
fact_name :: FactDef -> String
fact_name (Fact n _ _) = n

fact_desc :: FactDef -> String
fact_desc (Fact _ d _) = d

fact_args :: FactDef -> [FactAttribute]
fact_args (Fact _ _ atr) = atr

fact_args_name :: FactAttribute -> String
fact_args_name (FAttrib _ (Name n) _) = n

fact_args_desc :: FactAttribute -> String
fact_args_desc (FAttrib _ _ d) = d

-- Name of the type of a message function
query_sig_type :: String -> QueryDef -> String
query_sig_type sn q@(Query _ _ _) = idscope sn (query_name q) "query"


-- Name of a given message definition
query_name :: QueryDef -> String
query_name (Query n _ _) = n

-- Name of the C type for a concrete flounder type, struct, or enum
type_c_enum :: String -> String -> String
type_c_enum sn e = ifscope name e
  where
    name = [ toUpper x | x <- sn ]

type_c_define :: String -> String -> String -> String 
type_c_define sn e mod = ifscope sname ename ++ "_" ++ mod2
  where
    sname = [ toUpper x | x <- sn ]
    ename = [ toUpper x | x <- e ]  
    mod2 = [ toUpper x | x <- mod ]

type_c_name :: String -> TypeRef -> String
type_c_name sn (Builtin String) = undefined
type_c_name sn (Builtin t) = (show t) ++ "_t"
type_c_name sn (TypeVar t) = type_c_name1 sn t
type_c_name sn (TypeAlias t _) = type_c_name1 sn t
type_c_name sn (FactType t) = type_c_name1 sn t

type_c_name1 :: String -> String -> String
type_c_name1 sn tn = (ifscope sn tn) ++ "_t"


type_c_type :: String -> TypeRef -> C.TypeSpec
type_c_type sn (Builtin Char) = C.TypeName "char"
type_c_type sn (Builtin Bool) = C.TypeName "bool"
type_c_type sn (Builtin String) = C.Ptr $ C.TypeName "char"
type_c_type sn t = C.TypeName $ type_c_name sn t

------------------------------------------------------------------------
-- Code shared by backend implementations
------------------------------------------------------------------------

schema_preamble :: String -> String -> String -> C.Unit
schema_preamble infile name descr = 
    C.MultiComment [ 
          "Copyright (c) 2015, ETH Zurich.",
          "All rights reserved.",
          "",
          "SCHEMA NAME: " ++ name,
          "SCHEMA FILE: " ++ infile,
          "SCHEMA DESCRIPTION: " ++ descr,
          "",
          "This file is distributed under the terms in the attached LICENSE",
          "file. If you do not find this file, copies can be found by",
          "writing to:",
          "ETH Zurich D-INFK, Universitaetstr.6, CH-8092 Zurich.",
          "Attn: Systems Group.",
          "",
          "THIS FILE IS AUTOMATICALLY GENERATED BY SOCKEYE: DO NOT EDIT!" ]


fact_argdecl :: String -> FactAttribute -> [C.Param]
fact_argdecl sn (FAttrib tr (Name n) desc) = 
    [ C.Param (type_c_type sn tr) n ]

fact_attrib_decl :: String -> FactAttribute -> [C.Param]
fact_attrib_decl sn (FAttrib tr (Name n) desc) = 
    [ C.ParamComment desc,
      C.Param (type_c_type sn tr) n ]

--msg_argdecl RX sn (Arg tr (DynamicArray n l)) = 
--    [ C.Param (C.Ptr $ type_c_type_dir RX sn tr) n, 
--      C.Param (type_c_type_dir RX sn size) l ]
--msg_argdecl TX sn (Arg tr (DynamicArray n l)) = 
--    [ C.Param (C.Ptr $ C.ConstT $ type_c_type_dir TX sn tr) n, 
--      C.Param (type_c_type_dir TX sn size) l ]


query_argdecl :: String -> QueryParam -> [C.Param]
query_argdecl sn (QParam (Name n) desc) = 
    [  ]


-- misc common bits of C
localvar = C.VarDecl C.NoScope C.NonConst
errvar = C.Variable "err"    