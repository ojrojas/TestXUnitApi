�(
T/home/orojasg/Sources/Test/NetCore/TestXunitApi/Api/Controllers/PersonsController.cs
	namespace 	
Api
 
.
Controllers 
{ 
[ 
Produces 
(
$str  
)  !
]! "
[		 
Route		 

(		
 
$str		 
)		 
]		 
public

 

class

 
PersonsController

 "
:

# $

Controller

% /
{ 
private 
IPersonService 
_personService -
;- .
public 
PersonsController  
(  !
IPersonService! /

)= >
{ 	
_personService 
= 

;* +
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 

>' (
Get) ,
(, -
)- .
{ 	
var 
models 
= 
await 
Task #
.# $
Run$ '
(' (
(( )
)) *
=>* ,
_personService- ;
.; <
GetAll< B
(B C
)C D
)D E
;E F
return 
Ok 
( 
models 
) 
; 
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 

>' (
Get) ,
(, -
int- 0
id1 3
)3 4
{ 	
var 
model 
= 
await 
Task !
.! "
Run" %
(% &
(& '
)' (
=>( *
_personService+ 9
.9 :
Get: =
(= >
id> @
)@ A
)A B
;B C
return 
Ok 
( 
model 
) 
; 
}   	
["" 	
HttpPost""	 
]"" 
public## 
async## 
Task## 
<## 

>##' (
Post##) -
(##- .
[##. /
FromBody##/ 7
]##7 8
Person##8 >
model##? D
)##D E
{$$ 	
if%% 
(%% 
!%% 

ModelState%% 
.%% 
IsValid%% #
)%%# $
{&& 
return'' 

BadRequest'' !
(''! "

ModelState''" ,
)'', -
;''- .
}(( 
var** 
person** 
=** 
await** 
Task** "
.**" #
Run**# &
(**& '
(**' (
)**( )
=>**) +
_personService**, :
.**: ;
Add**; >
(**> ?
model**? D
)**D E
)**E F
;**F G
return,, 
CreatedAtAction,, "
(,," #
$str,,# (
,,,( )
new,,* -
{,,. /
id,,0 2
=,,3 4
person,,5 ;
.,,; <
Id,,< >
},,? @
,,,@ A
person,,B H
),,H I
;,,I J
}-- 	
[// 	
HttpPut//	 
(// 
$str// 
)// 
]// 
public00 
async00 
Task00 
<00 

>00' (
Put00) ,
(00, -
int00- 0
id001 3
,003 4
[005 6
FromBody006 >
]00> ?
Person00? E
model00F K
)00K L
{11 	
if22 
(22 
!22 

ModelState22 
.22 
IsValid22 #
)22# $
{33 
return44 

BadRequest44 !
(44! "

ModelState44" ,
)44, -
;44- .
}55 
await77 
Task77 
.77 
Run77 
(77 
(77 
)77 
=>77 
_personService77 -
.77- .
Update77. 4
(774 5
id775 7
,777 8
model779 >
)77> ?
)77? @
;77@ A
return88 
	NoContent88 
(88 
)88 
;88 
}99 	
[;; 	

HttpDelete;;	 
(;; 
$str;; 
);; 
];; 
public<< 
async<< 
Task<< 
<<< 

><<' (
Delete<<) /
(<</ 0
int<<0 3
id<<4 6
)<<6 7
{== 	
await>> 
Task>> 
.>> 
Run>> 
(>> 
(>> 
)>> 
=>>> 
_personService>> -
.>>- .
Delete>>. 4
(>>4 5
id>>5 7
)>>7 8
)>>8 9
;>>9 :
return?? 
	NoContent?? 
(?? 
)?? 
;?? 
}@@ 	
}AA 
}BB �
D/home/orojasg/Sources/Test/NetCore/TestXunitApi/Api/Models/Person.cs
	namespace 	
Api
 
.
Models 
{ 
public		 

class		 
Person		 
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public
string
	FirstName
{
get
;
set
;
}
[ 	
Required	 
] 
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Age 
{ 
get 
; 
set !
;! "
}# $
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
Phone	 
] 
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} �

>/home/orojasg/Sources/Test/NetCore/TestXunitApi/Api/Program.cs
	namespace

 	
Api


 
{ 
public 

class 
Program 
{
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} �
N/home/orojasg/Sources/Test/NetCore/TestXunitApi/Api/Services/IPersonService.cs
	namespace 	
Api
 
.
Services 
{ 
public 

	interface 
IPersonService #
{ 
IEnumerable 
< 
Person 
> 
GetAll "
(" #
)# $
;$ %
Person		 
Get		 
(		 
int		 
id		 
)		 
;		 
Person

 
Add

 
(

 
Person

 
person

  
)

  !
;

! "
void 
Update
( 
int 
id 
, 
Person "
person# )
)) *
;* +
void 
Delete
( 
int 
id 
) 
; 
}
} �(
M/home/orojasg/Sources/Test/NetCore/TestXunitApi/Api/Services/PersonService.cs
	namespace 	
Api
 
.
Services 
{ 
public 

class 

:  
IPersonService! /
{ 	
private		 
List		 
<		 
Person		 
>		  
Persons		! (
{		) *
get		+ .
;		. /
set		0 3
;		3 4
}		5 6
public 

(  !
)! "
{ 
var
y
=
$num
;
this 
. 
Persons 
= 
new "
List# '
<' (
Person( .
>. /
(/ 0
)0 1
;1 2
for 
( 
int 
i 
= 
$num 
; 
i  !
<" #
$num$ &
;& '
i( )
++) +
)+ ,
{ 
y 
++ 
; 
this 
. 
Persons !
.! "
Add" %
(% &
new& )
Person* 0
{1 2
Id 
= 
y 
} 
) 
; 
} 
} 
public 
IEnumerable 
< 
Person %
>% &
GetAll' -
(- .
). /
{ 
return 
this 
. 
Persons #
;# $
} 
public 
Person 
Get 
( 
int !
id" $
)$ %
{ 
return 
this 
. 
Persons #
.# $
First$ )
() *
x* +
=>, .
x/ 0
.0 1
Id1 3
==4 6
id7 9
)9 :
;: ;
}   
public"" 
Person"" 
Add"" 
("" 
Person"" $
person""% +
)""+ ,
{## 
var$$ 
newid$$ 
=$$ 
Persons$$ #
.$$# $
OrderBy$$$ +
($$+ ,
x$$, -
=>$$. 0
x$$1 2
.$$2 3
Id$$3 5
)$$5 6
.$$6 7
Last$$7 ;
($$; <
)$$< =
.$$= >
Id$$> @
+$$A B
$num$$C D
;$$D E
person%% 
.%% 
Id%% 
=%% 
newid%% !
;%%! "
this'' 
.'' 
Persons'' 
.'' 
Add''  
(''  !
person''! '
)''' (
;''( )
return)) 
person)) 
;)) 
}** 
public,, 
void,, 
Update,, 
(,, 
int,, "
id,,# %
,,,% &
Person,,' -
person,,. 4
),,4 5
{-- 
var.. 
existing.. 
=.. 
this.. #
...# $
Persons..$ +
...+ ,
First.., 1
(..1 2
x..2 3
=>..4 6
x..7 8
...8 9
Id..9 ;
==..< >
id..? A
)..A B
;..B C
existing// 
.// 
	FirstName// "
=//# $
person//% +
.//+ ,
	FirstName//, 5
;//5 6
existing00 
.00 
LastName00 !
=00" #
person00$ *
.00* +
LastName00+ 3
;003 4
existing11 
.11 
Address11  
=11! "
person11# )
.11) *
Address11* 1
;111 2
existing22 
.22 
Age22 
=22 
person22 %
.22% &
Age22& )
;22) *
existing33 
.33 
City33 
=33 
person33  &
.33& '
City33' +
;33+ ,
existing44 
.44 
Email44 
=44  
person44! '
.44' (
Email44( -
;44- .
existing55 
.55 
Phone55 
=55  
person55! '
.55' (
Phone55( -
;55- .
existing66 
.66 
Title66 
=66  
person66! '
.66' (
Title66( -
;66- .
}77 
public99 
void99 
Delete99 
(99 
int99 "
id99# %
)99% &
{:: 
var;; 
existing;; 
=;; 
this;; #
.;;# $
Persons;;$ +
.;;+ ,
First;;, 1
(;;1 2
x;;2 3
=>;;4 6
x;;7 8
.;;8 9
Id;;9 ;
==;;< >
id;;? A
);;A B
;;;B C
this<< 
.<< 
Persons<< 
.<< 
Remove<< #
(<<# $
existing<<$ ,
)<<, -
;<<- .
}== 
}>> 	
}AA �
>/home/orojasg/Sources/Test/NetCore/TestXunitApi/Api/Startup.cs
	namespace 	
Api
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %

)3 4
{ 	

= 

;) *
} 	
public 
IConfiguration 

{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
	AddScoped 
< 
IPersonService -
,- .

>; <
(< =
)= >
;> ?
} 	
public"" 
void"" 
	Configure"" 
("" 
IApplicationBuilder"" 1
app""2 5
,""5 6
IWebHostEnvironment""7 J
env""K N
)""N O
{## 	
if$$ 
($$ 
env$$ 
.$$ 

($$! "
)$$" #
)$$# $
{%% 
app&& 
.&& %
UseDeveloperExceptionPage&& -
(&&- .
)&&. /
;&&/ 0
}'' 
app)) 
.)) 
UseHttpsRedirection)) #
())# $
)))$ %
;))% &
app++ 
.++ 

UseRouting++ 
(++ 
)++ 
;++ 
app-- 
.-- 
UseAuthorization--  
(--  !
)--! "
;--" #
app// 
.// 
UseEndpoints// 
(// 
	endpoints// &
=>//' )
{00 
	endpoints11 
.11 
MapControllers11 (
(11( )
)11) *
;11* +
}22 
)22
;22 
}33 	
}44 
}55 �
3/tmp/.NETCoreApp,Version=v3.1.AssemblyAttributes.cs
[ 
assembly 	
:	 

global 
:: 
System 
. 
Runtime !
.! "

Versioning" ,
., -$
TargetFrameworkAttribute- E
(E F
$strF `
,` a 
FrameworkDisplayNameb v
=w x
$stry {
){ |
]| }�
_/home/orojasg/Sources/Test/NetCore/TestXunitApi/Api/obj/Debug/netcoreapp3.1/Api.AssemblyInfo.cs
[
assembly
:

System
.

Reflection
.
AssemblyCompanyAttribute
(
$str
)
]
[ 
assembly 	
:	 

System 
. 

Reflection 
. *
AssemblyConfigurationAttribute ;
(; <
$str< C
)C D
]D E
[ 
assembly 	
:	 

System 
. 

Reflection 
. (
AssemblyFileVersionAttribute 9
(9 :
$str: C
)C D
]D E
[ 
assembly 	
:	 

System 
. 

Reflection 
. 1
%AssemblyInformationalVersionAttribute B
(B C
$strC J
)J K
]K L
[ 
assembly 	
:	 

System 
. 

Reflection 
. $
AssemblyProductAttribute 5
(5 6
$str6 ;
); <
]< =
[ 
assembly 	
:	 

System 
. 

Reflection 
. "
AssemblyTitleAttribute 3
(3 4
$str4 9
)9 :
]: ;
[ 
assembly 	
:	 

System 
. 

Reflection 
. $
AssemblyVersionAttribute 5
(5 6
$str6 ?
)? @
]@ A