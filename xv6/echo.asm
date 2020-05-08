
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       0:	f3 0f 1e fb          	endbr32 
       4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       8:	83 e4 f0             	and    $0xfffffff0,%esp
       b:	ff 71 fc             	pushl  -0x4(%ecx)
       e:	55                   	push   %ebp
       f:	89 e5                	mov    %esp,%ebp
      11:	56                   	push   %esi
      12:	53                   	push   %ebx
      13:	51                   	push   %ecx
      14:	83 ec 0c             	sub    $0xc,%esp
      17:	8b 01                	mov    (%ecx),%eax
      19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  for(i = 1; i < argc; i++)
      1c:	83 f8 01             	cmp    $0x1,%eax
      1f:	7e 4b                	jle    6c <main+0x6c>
      21:	8d 5a 04             	lea    0x4(%edx),%ebx
      24:	8d 34 82             	lea    (%edx,%eax,4),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
      27:	83 c3 04             	add    $0x4,%ebx
      2a:	8b 43 fc             	mov    -0x4(%ebx),%eax
      2d:	39 f3                	cmp    %esi,%ebx
      2f:	74 26                	je     57 <main+0x57>
      31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      38:	68 c8 10 00 00       	push   $0x10c8
      3d:	83 c3 04             	add    $0x4,%ebx
      40:	50                   	push   %eax
      41:	68 ca 10 00 00       	push   $0x10ca
      46:	6a 01                	push   $0x1
      48:	e8 73 0c 00 00       	call   cc0 <printf>
  for(i = 1; i < argc; i++)
      4d:	8b 43 fc             	mov    -0x4(%ebx),%eax
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
      50:	83 c4 10             	add    $0x10,%esp
      53:	39 f3                	cmp    %esi,%ebx
      55:	75 e1                	jne    38 <main+0x38>
      57:	68 cf 10 00 00       	push   $0x10cf
      5c:	50                   	push   %eax
      5d:	68 ca 10 00 00       	push   $0x10ca
      62:	6a 01                	push   $0x1
      64:	e8 57 0c 00 00       	call   cc0 <printf>
      69:	83 c4 10             	add    $0x10,%esp
  exit();
      6c:	e8 2f 05 00 00       	call   5a0 <exit>
      71:	66 90                	xchg   %ax,%ax
      73:	66 90                	xchg   %ax,%ax
      75:	66 90                	xchg   %ax,%ax
      77:	66 90                	xchg   %ax,%ax
      79:	66 90                	xchg   %ax,%ax
      7b:	66 90                	xchg   %ax,%ax
      7d:	66 90                	xchg   %ax,%ax
      7f:	90                   	nop

00000080 <strcpy>:

char **environ = 0;

char*
strcpy(char *s, char *t)
{
      80:	f3 0f 1e fb          	endbr32 
      84:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
      85:	31 c0                	xor    %eax,%eax
{
      87:	89 e5                	mov    %esp,%ebp
      89:	53                   	push   %ebx
      8a:	8b 4d 08             	mov    0x8(%ebp),%ecx
      8d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
      90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
      94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
      97:	83 c0 01             	add    $0x1,%eax
      9a:	84 d2                	test   %dl,%dl
      9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
      9e:	89 c8                	mov    %ecx,%eax
      a0:	5b                   	pop    %ebx
      a1:	5d                   	pop    %ebp
      a2:	c3                   	ret    
      a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      b0:	f3 0f 1e fb          	endbr32 
      b4:	55                   	push   %ebp
      b5:	89 e5                	mov    %esp,%ebp
      b7:	53                   	push   %ebx
      b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
      bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
      be:	0f b6 01             	movzbl (%ecx),%eax
      c1:	0f b6 1a             	movzbl (%edx),%ebx
      c4:	84 c0                	test   %al,%al
      c6:	75 19                	jne    e1 <strcmp+0x31>
      c8:	eb 26                	jmp    f0 <strcmp+0x40>
      ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
      d4:	83 c1 01             	add    $0x1,%ecx
      d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
      da:	0f b6 1a             	movzbl (%edx),%ebx
      dd:	84 c0                	test   %al,%al
      df:	74 0f                	je     f0 <strcmp+0x40>
      e1:	38 d8                	cmp    %bl,%al
      e3:	74 eb                	je     d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
      e5:	29 d8                	sub    %ebx,%eax
}
      e7:	5b                   	pop    %ebx
      e8:	5d                   	pop    %ebp
      e9:	c3                   	ret    
      ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
      f2:	29 d8                	sub    %ebx,%eax
}
      f4:	5b                   	pop    %ebx
      f5:	5d                   	pop    %ebp
      f6:	c3                   	ret    
      f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fe:	66 90                	xchg   %ax,%ax

00000100 <strlen>:

uint
strlen(const char *s)
{
     100:	f3 0f 1e fb          	endbr32 
     104:	55                   	push   %ebp
     105:	89 e5                	mov    %esp,%ebp
     107:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     10a:	80 3a 00             	cmpb   $0x0,(%edx)
     10d:	74 21                	je     130 <strlen+0x30>
     10f:	31 c0                	xor    %eax,%eax
     111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     118:	83 c0 01             	add    $0x1,%eax
     11b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     11f:	89 c1                	mov    %eax,%ecx
     121:	75 f5                	jne    118 <strlen+0x18>
    ;
  return n;
}
     123:	89 c8                	mov    %ecx,%eax
     125:	5d                   	pop    %ebp
     126:	c3                   	ret    
     127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     12e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
     130:	31 c9                	xor    %ecx,%ecx
}
     132:	5d                   	pop    %ebp
     133:	89 c8                	mov    %ecx,%eax
     135:	c3                   	ret    
     136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <safestrcpy>:

char*
safestrcpy(char *s, const char *t, int n)
{
     140:	f3 0f 1e fb          	endbr32 
     144:	55                   	push   %ebp
     145:	89 e5                	mov    %esp,%ebp
     147:	56                   	push   %esi
     148:	8b 55 10             	mov    0x10(%ebp),%edx
     14b:	8b 75 08             	mov    0x8(%ebp),%esi
     14e:	53                   	push   %ebx
     14f:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *os;
  
  os = s;
  if(n <= 0)
     152:	85 d2                	test   %edx,%edx
     154:	7e 21                	jle    177 <safestrcpy+0x37>
     156:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
     15a:	89 f2                	mov    %esi,%edx
     15c:	eb 12                	jmp    170 <safestrcpy+0x30>
     15e:	66 90                	xchg   %ax,%ax
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
     160:	0f b6 08             	movzbl (%eax),%ecx
     163:	83 c0 01             	add    $0x1,%eax
     166:	83 c2 01             	add    $0x1,%edx
     169:	88 4a ff             	mov    %cl,-0x1(%edx)
     16c:	84 c9                	test   %cl,%cl
     16e:	74 04                	je     174 <safestrcpy+0x34>
     170:	39 d8                	cmp    %ebx,%eax
     172:	75 ec                	jne    160 <safestrcpy+0x20>
    ;
  *s = 0;
     174:	c6 02 00             	movb   $0x0,(%edx)
  return os;
}
     177:	89 f0                	mov    %esi,%eax
     179:	5b                   	pop    %ebx
     17a:	5e                   	pop    %esi
     17b:	5d                   	pop    %ebp
     17c:	c3                   	ret    
     17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
     180:	f3 0f 1e fb          	endbr32 
     184:	55                   	push   %ebp
     185:	89 e5                	mov    %esp,%ebp
     187:	57                   	push   %edi
     188:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     18b:	8b 4d 10             	mov    0x10(%ebp),%ecx
     18e:	8b 45 0c             	mov    0xc(%ebp),%eax
     191:	89 d7                	mov    %edx,%edi
     193:	fc                   	cld    
     194:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     196:	89 d0                	mov    %edx,%eax
     198:	5f                   	pop    %edi
     199:	5d                   	pop    %ebp
     19a:	c3                   	ret    
     19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     19f:	90                   	nop

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
     1a0:	f3 0f 1e fb          	endbr32 
     1a4:	55                   	push   %ebp
     1a5:	89 e5                	mov    %esp,%ebp
     1a7:	8b 45 08             	mov    0x8(%ebp),%eax
     1aa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     1ae:	0f b6 10             	movzbl (%eax),%edx
     1b1:	84 d2                	test   %dl,%dl
     1b3:	75 16                	jne    1cb <strchr+0x2b>
     1b5:	eb 21                	jmp    1d8 <strchr+0x38>
     1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1be:	66 90                	xchg   %ax,%ax
     1c0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     1c4:	83 c0 01             	add    $0x1,%eax
     1c7:	84 d2                	test   %dl,%dl
     1c9:	74 0d                	je     1d8 <strchr+0x38>
    if(*s == c)
     1cb:	38 d1                	cmp    %dl,%cl
     1cd:	75 f1                	jne    1c0 <strchr+0x20>
      return (char*)s;
  return 0;
}
     1cf:	5d                   	pop    %ebp
     1d0:	c3                   	ret    
     1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     1d8:	31 c0                	xor    %eax,%eax
}
     1da:	5d                   	pop    %ebp
     1db:	c3                   	ret    
     1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <fgets>:
  return fgets(buf, max, 0);
}

char*
fgets(char* buf, int size, int fd)
{
     1e0:	f3 0f 1e fb          	endbr32 
     1e4:	55                   	push   %ebp
     1e5:	89 e5                	mov    %esp,%ebp
     1e7:	57                   	push   %edi
  int i;
  char c;

  for(i = 0; i + 1 < size;){
     1e8:	31 ff                	xor    %edi,%edi
{
     1ea:	56                   	push   %esi
     1eb:	53                   	push   %ebx
     1ec:	89 fb                	mov    %edi,%ebx
     1ee:	83 ec 1c             	sub    $0x1c,%esp
     1f1:	8b 75 08             	mov    0x8(%ebp),%esi
     1f4:	89 f7                	mov    %esi,%edi
  for(i = 0; i + 1 < size;){
     1f6:	eb 32                	jmp    22a <fgets+0x4a>
     1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ff:	90                   	nop
    int cc = read(fd, &c, 1);
     200:	83 ec 04             	sub    $0x4,%esp
     203:	8d 45 e7             	lea    -0x19(%ebp),%eax
     206:	6a 01                	push   $0x1
     208:	50                   	push   %eax
     209:	ff 75 10             	pushl  0x10(%ebp)
     20c:	e8 3a 04 00 00       	call   64b <read>
    if(cc < 1)
     211:	83 c4 10             	add    $0x10,%esp
     214:	85 c0                	test   %eax,%eax
     216:	7e 1c                	jle    234 <fgets+0x54>
      break;
    buf[i++] = c;
     218:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     21c:	83 c7 01             	add    $0x1,%edi
     21f:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     222:	3c 0a                	cmp    $0xa,%al
     224:	74 22                	je     248 <fgets+0x68>
     226:	3c 0d                	cmp    $0xd,%al
     228:	74 1e                	je     248 <fgets+0x68>
  for(i = 0; i + 1 < size;){
     22a:	83 c3 01             	add    $0x1,%ebx
     22d:	89 fe                	mov    %edi,%esi
     22f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     232:	7c cc                	jl     200 <fgets+0x20>
     234:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     236:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     239:	c6 03 00             	movb   $0x0,(%ebx)
}
     23c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     23f:	5b                   	pop    %ebx
     240:	5e                   	pop    %esi
     241:	5f                   	pop    %edi
     242:	5d                   	pop    %ebp
     243:	c3                   	ret    
     244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     248:	89 df                	mov    %ebx,%edi
     24a:	8b 5d 08             	mov    0x8(%ebp),%ebx
     24d:	8b 45 08             	mov    0x8(%ebp),%eax
     250:	01 fb                	add    %edi,%ebx
  buf[i] = '\0';
     252:	c6 03 00             	movb   $0x0,(%ebx)
}
     255:	8d 65 f4             	lea    -0xc(%ebp),%esp
     258:	5b                   	pop    %ebx
     259:	5e                   	pop    %esi
     25a:	5f                   	pop    %edi
     25b:	5d                   	pop    %ebp
     25c:	c3                   	ret    
     25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <gets>:
{
     260:	f3 0f 1e fb          	endbr32 
     264:	55                   	push   %ebp
     265:	89 e5                	mov    %esp,%ebp
     267:	83 ec 0c             	sub    $0xc,%esp
  return fgets(buf, max, 0);
     26a:	6a 00                	push   $0x0
     26c:	ff 75 0c             	pushl  0xc(%ebp)
     26f:	ff 75 08             	pushl  0x8(%ebp)
     272:	e8 69 ff ff ff       	call   1e0 <fgets>
}
     277:	c9                   	leave  
     278:	c3                   	ret    
     279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <stat>:

int
stat(char *n, struct stat *st)
{
     280:	f3 0f 1e fb          	endbr32 
     284:	55                   	push   %ebp
     285:	89 e5                	mov    %esp,%ebp
     287:	56                   	push   %esi
     288:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY | O_NONBLOCK);
     289:	83 ec 08             	sub    $0x8,%esp
     28c:	68 00 08 00 00       	push   $0x800
     291:	ff 75 08             	pushl  0x8(%ebp)
     294:	e8 75 04 00 00       	call   70e <open>
  if(fd < 0)
     299:	83 c4 10             	add    $0x10,%esp
     29c:	85 c0                	test   %eax,%eax
     29e:	78 28                	js     2c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     2a0:	83 ec 08             	sub    $0x8,%esp
     2a3:	ff 75 0c             	pushl  0xc(%ebp)
     2a6:	89 c3                	mov    %eax,%ebx
     2a8:	50                   	push   %eax
     2a9:	e8 fc 04 00 00       	call   7aa <fstat>
  close(fd);
     2ae:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     2b1:	89 c6                	mov    %eax,%esi
  close(fd);
     2b3:	e8 e1 03 00 00       	call   699 <close>
  return r;
     2b8:	83 c4 10             	add    $0x10,%esp
}
     2bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2be:	89 f0                	mov    %esi,%eax
     2c0:	5b                   	pop    %ebx
     2c1:	5e                   	pop    %esi
     2c2:	5d                   	pop    %ebp
     2c3:	c3                   	ret    
     2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     2c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
     2cd:	eb ec                	jmp    2bb <stat+0x3b>
     2cf:	90                   	nop

000002d0 <atoi>:

int
atoi(const char *s)
{
     2d0:	f3 0f 1e fb          	endbr32 
     2d4:	55                   	push   %ebp
     2d5:	89 e5                	mov    %esp,%ebp
     2d7:	53                   	push   %ebx
     2d8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     2db:	0f be 02             	movsbl (%edx),%eax
     2de:	8d 48 d0             	lea    -0x30(%eax),%ecx
     2e1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     2e4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     2e9:	77 1a                	ja     305 <atoi+0x35>
     2eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     2ef:	90                   	nop
    n = n*10 + *s++ - '0';
     2f0:	83 c2 01             	add    $0x1,%edx
     2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     2fa:	0f be 02             	movsbl (%edx),%eax
     2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     300:	80 fb 09             	cmp    $0x9,%bl
     303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
     305:	89 c8                	mov    %ecx,%eax
     307:	5b                   	pop    %ebx
     308:	5d                   	pop    %ebp
     309:	c3                   	ret    
     30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     310:	f3 0f 1e fb          	endbr32 
     314:	55                   	push   %ebp
     315:	89 e5                	mov    %esp,%ebp
     317:	57                   	push   %edi
     318:	8b 45 10             	mov    0x10(%ebp),%eax
     31b:	8b 55 08             	mov    0x8(%ebp),%edx
     31e:	56                   	push   %esi
     31f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     322:	85 c0                	test   %eax,%eax
     324:	7e 0f                	jle    335 <memmove+0x25>
     326:	01 d0                	add    %edx,%eax
  dst = vdst;
     328:	89 d7                	mov    %edx,%edi
     32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
     330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     331:	39 f8                	cmp    %edi,%eax
     333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
     335:	5e                   	pop    %esi
     336:	89 d0                	mov    %edx,%eax
     338:	5f                   	pop    %edi
     339:	5d                   	pop    %ebp
     33a:	c3                   	ret    
     33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     33f:	90                   	nop

00000340 <strncmp>:

int
strncmp(const char* p, const char* q, uint n)
{
     340:	f3 0f 1e fb          	endbr32 
     344:	55                   	push   %ebp
     345:	89 e5                	mov    %esp,%ebp
     347:	56                   	push   %esi
     348:	8b 75 10             	mov    0x10(%ebp),%esi
     34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
     34e:	53                   	push   %ebx
     34f:	8b 45 0c             	mov    0xc(%ebp),%eax
  while(n > 0 && *p && (*p == *q))
     352:	85 f6                	test   %esi,%esi
     354:	74 32                	je     388 <strncmp+0x48>
     356:	01 c6                	add    %eax,%esi
     358:	eb 14                	jmp    36e <strncmp+0x2e>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     360:	38 da                	cmp    %bl,%dl
     362:	75 14                	jne    378 <strncmp+0x38>
    n--, p++, q++;
     364:	83 c0 01             	add    $0x1,%eax
     367:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && (*p == *q))
     36a:	39 c6                	cmp    %eax,%esi
     36c:	74 1a                	je     388 <strncmp+0x48>
     36e:	0f b6 11             	movzbl (%ecx),%edx
     371:	0f be 18             	movsbl (%eax),%ebx
     374:	84 d2                	test   %dl,%dl
     376:	75 e8                	jne    360 <strncmp+0x20>
  if(n == 0)
    return 0;
  return (int)*p - (int)*q;
     378:	0f be c2             	movsbl %dl,%eax
     37b:	29 d8                	sub    %ebx,%eax
}
     37d:	5b                   	pop    %ebx
     37e:	5e                   	pop    %esi
     37f:	5d                   	pop    %ebp
     380:	c3                   	ret    
     381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     388:	5b                   	pop    %ebx
    return 0;
     389:	31 c0                	xor    %eax,%eax
}
     38b:	5e                   	pop    %esi
     38c:	5d                   	pop    %ebp
     38d:	c3                   	ret    
     38e:	66 90                	xchg   %ax,%ax

00000390 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
     390:	f3 0f 1e fb          	endbr32 
     394:	55                   	push   %ebp
     395:	89 e5                	mov    %esp,%ebp
     397:	57                   	push   %edi
     398:	56                   	push   %esi
     399:	8b 75 08             	mov    0x8(%ebp),%esi
     39c:	53                   	push   %ebx
     39d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
     3a0:	89 f2                	mov    %esi,%edx
     3a2:	eb 1b                	jmp    3bf <strncpy+0x2f>
     3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     3a8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
     3ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
     3af:	83 c2 01             	add    $0x1,%edx
     3b2:	0f b6 7f ff          	movzbl -0x1(%edi),%edi
     3b6:	89 f9                	mov    %edi,%ecx
     3b8:	88 4a ff             	mov    %cl,-0x1(%edx)
     3bb:	84 c9                	test   %cl,%cl
     3bd:	74 09                	je     3c8 <strncpy+0x38>
     3bf:	89 c3                	mov    %eax,%ebx
     3c1:	83 e8 01             	sub    $0x1,%eax
     3c4:	85 db                	test   %ebx,%ebx
     3c6:	7f e0                	jg     3a8 <strncpy+0x18>
    ;
  while(n-- > 0)
     3c8:	89 d1                	mov    %edx,%ecx
     3ca:	85 c0                	test   %eax,%eax
     3cc:	7e 15                	jle    3e3 <strncpy+0x53>
     3ce:	66 90                	xchg   %ax,%ax
    *s++ = 0;
     3d0:	83 c1 01             	add    $0x1,%ecx
     3d3:	c6 41 ff 00          	movb   $0x0,-0x1(%ecx)
  while(n-- > 0)
     3d7:	89 c8                	mov    %ecx,%eax
     3d9:	f7 d0                	not    %eax
     3db:	01 d0                	add    %edx,%eax
     3dd:	01 d8                	add    %ebx,%eax
     3df:	85 c0                	test   %eax,%eax
     3e1:	7f ed                	jg     3d0 <strncpy+0x40>
  return os;
}
     3e3:	5b                   	pop    %ebx
     3e4:	89 f0                	mov    %esi,%eax
     3e6:	5e                   	pop    %esi
     3e7:	5f                   	pop    %edi
     3e8:	5d                   	pop    %ebp
     3e9:	c3                   	ret    
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <strrchr>:

char*
strrchr(const char *s, int c)
{
     3f0:	f3 0f 1e fb          	endbr32 
     3f4:	55                   	push   %ebp
  char *p = (char*)s;
  char *result = 0;
     3f5:	31 c9                	xor    %ecx,%ecx
{
     3f7:	89 e5                	mov    %esp,%ebp
     3f9:	53                   	push   %ebx
     3fa:	8b 55 08             	mov    0x8(%ebp),%edx
     3fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while (*p) {
     400:	0f be 02             	movsbl (%edx),%eax
     403:	84 c0                	test   %al,%al
     405:	74 19                	je     420 <strrchr+0x30>
     407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     40e:	66 90                	xchg   %ax,%ax
    if (*p == c) {
     410:	39 d8                	cmp    %ebx,%eax
     412:	0f 44 ca             	cmove  %edx,%ecx
  while (*p) {
     415:	0f be 42 01          	movsbl 0x1(%edx),%eax
      result = p;
    }
    p++;
     419:	83 c2 01             	add    $0x1,%edx
  while (*p) {
     41c:	84 c0                	test   %al,%al
     41e:	75 f0                	jne    410 <strrchr+0x20>
  }
  if (*p == c) return p;
     420:	85 db                	test   %ebx,%ebx
  return result;
}
     422:	5b                   	pop    %ebx
     423:	5d                   	pop    %ebp
  if (*p == c) return p;
     424:	0f 44 ca             	cmove  %edx,%ecx
}
     427:	89 c8                	mov    %ecx,%eax
     429:	c3                   	ret    
     42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000430 <strchrnul>:

char*
strchrnul(const char* s, int c)
{
     430:	f3 0f 1e fb          	endbr32 
     434:	55                   	push   %ebp
     435:	89 e5                	mov    %esp,%ebp
     437:	8b 55 08             	mov    0x8(%ebp),%edx
     43a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *p = (char*)s;
  while (*p && *p != c) {
     43d:	0f be 02             	movsbl (%edx),%eax
     440:	84 c0                	test   %al,%al
     442:	75 17                	jne    45b <strchrnul+0x2b>
     444:	eb 19                	jmp    45f <strchrnul+0x2f>
     446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     44d:	8d 76 00             	lea    0x0(%esi),%esi
     450:	0f be 42 01          	movsbl 0x1(%edx),%eax
    p++;
     454:	83 c2 01             	add    $0x1,%edx
  while (*p && *p != c) {
     457:	84 c0                	test   %al,%al
     459:	74 04                	je     45f <strchrnul+0x2f>
     45b:	39 c8                	cmp    %ecx,%eax
     45d:	75 f1                	jne    450 <strchrnul+0x20>
  }
  return p;
}
     45f:	89 d0                	mov    %edx,%eax
     461:	5d                   	pop    %ebp
     462:	c3                   	ret    
     463:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     46a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000470 <getenv>:

char*
getenv(const char *name)
{
     470:	f3 0f 1e fb          	endbr32 
     474:	55                   	push   %ebp
     475:	89 e5                	mov    %esp,%ebp
     477:	57                   	push   %edi
     478:	56                   	push   %esi
     479:	53                   	push   %ebx
     47a:	83 ec 0c             	sub    $0xc,%esp
  for(n = 0; s[n]; n++)
     47d:	8b 45 08             	mov    0x8(%ebp),%eax
     480:	0f b6 00             	movzbl (%eax),%eax
     483:	88 45 eb             	mov    %al,-0x15(%ebp)
     486:	84 c0                	test   %al,%al
     488:	0f 84 95 00 00 00    	je     523 <getenv+0xb3>
     48e:	8b 55 08             	mov    0x8(%ebp),%edx
     491:	31 c0                	xor    %eax,%eax
     493:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     497:	90                   	nop
     498:	83 c0 01             	add    $0x1,%eax
     49b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     49f:	75 f7                	jne    498 <getenv+0x28>
     4a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int length = strlen(name);
  for (int i = 0; environ[i]; ++i) {
     4a4:	a1 fc 14 00 00       	mov    0x14fc,%eax
     4a9:	8b 38                	mov    (%eax),%edi
     4ab:	85 ff                	test   %edi,%edi
     4ad:	74 5c                	je     50b <getenv+0x9b>
     4af:	83 c0 04             	add    $0x4,%eax
     4b2:	8b 75 ec             	mov    -0x14(%ebp),%esi
     4b5:	03 75 08             	add    0x8(%ebp),%esi
     4b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
     4bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4bf:	90                   	nop
  while(n > 0 && *p && (*p == *q))
     4c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
     4c3:	85 c0                	test   %eax,%eax
     4c5:	74 2d                	je     4f4 <getenv+0x84>
     4c7:	8b 45 08             	mov    0x8(%ebp),%eax
  for(n = 0; s[n]; n++)
     4ca:	0f b6 5d eb          	movzbl -0x15(%ebp),%ebx
  while(n > 0 && *p && (*p == *q))
     4ce:	89 f9                	mov    %edi,%ecx
     4d0:	83 c0 01             	add    $0x1,%eax
     4d3:	eb 14                	jmp    4e9 <getenv+0x79>
     4d5:	8d 76 00             	lea    0x0(%esi),%esi
     4d8:	38 d3                	cmp    %dl,%bl
     4da:	75 21                	jne    4fd <getenv+0x8d>
    n--, p++, q++;
     4dc:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && (*p == *q))
     4df:	39 f0                	cmp    %esi,%eax
     4e1:	74 11                	je     4f4 <getenv+0x84>
     4e3:	0f b6 18             	movzbl (%eax),%ebx
     4e6:	83 c0 01             	add    $0x1,%eax
     4e9:	0f b6 11             	movzbl (%ecx),%edx
     4ec:	84 d2                	test   %dl,%dl
     4ee:	75 e8                	jne    4d8 <getenv+0x68>
    if (strncmp(environ[i], name, length) == 0 &&
     4f0:	84 db                	test   %bl,%bl
     4f2:	75 09                	jne    4fd <getenv+0x8d>
     4f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     4f7:	80 3c 07 3d          	cmpb   $0x3d,(%edi,%eax,1)
     4fb:	74 18                	je     515 <getenv+0xa5>
  for (int i = 0; environ[i]; ++i) {
     4fd:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
     501:	8b 45 f0             	mov    -0x10(%ebp),%eax
     504:	8b 78 fc             	mov    -0x4(%eax),%edi
     507:	85 ff                	test   %edi,%edi
     509:	75 b5                	jne    4c0 <getenv+0x50>
        environ[i][length] == '=') {
      return environ[i] + length + 1;
    }
  }
  return 0;
}
     50b:	83 c4 0c             	add    $0xc,%esp
     50e:	89 f8                	mov    %edi,%eax
     510:	5b                   	pop    %ebx
     511:	5e                   	pop    %esi
     512:	5f                   	pop    %edi
     513:	5d                   	pop    %ebp
     514:	c3                   	ret    
     515:	83 c4 0c             	add    $0xc,%esp
      return environ[i] + length + 1;
     518:	8d 7c 07 01          	lea    0x1(%edi,%eax,1),%edi
}
     51c:	5b                   	pop    %ebx
     51d:	89 f8                	mov    %edi,%eax
     51f:	5e                   	pop    %esi
     520:	5f                   	pop    %edi
     521:	5d                   	pop    %ebp
     522:	c3                   	ret    
  for(n = 0; s[n]; n++)
     523:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     52a:	e9 75 ff ff ff       	jmp    4a4 <getenv+0x34>
     52f:	90                   	nop

00000530 <clone_fn>:

#define STACKSIZE 4096

int
clone_fn(int (*fn)(void*), void* stack, void* arg)
{
     530:	f3 0f 1e fb          	endbr32 
     534:	55                   	push   %ebp
     535:	89 e5                	mov    %esp,%ebp
     537:	53                   	push   %ebx
     538:	83 ec 04             	sub    $0x4,%esp
     53b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int retval;
  if (stack == 0)
     53e:	85 db                	test   %ebx,%ebx
     540:	74 36                	je     578 <f1+0xf>
  {
    stack = (void*)malloc(STACKSIZE);
    stack = (void*)(stack + STACKSIZE);
  }
  stack = (void*)(((void**)stack) - 1);
  *(void**)stack = arg;
     542:	8b 45 10             	mov    0x10(%ebp),%eax
  __asm__ __volatile__(
     545:	8b 55 08             	mov    0x8(%ebp),%edx
  stack = (void*)(((void**)stack) - 1);
     548:	83 eb 04             	sub    $0x4,%ebx
  __asm__ __volatile__(
     54b:	b9 00 07 01 00       	mov    $0x10700,%ecx
  *(void**)stack = arg;
     550:	89 03                	mov    %eax,(%ebx)
  __asm__ __volatile__(
     552:	b8 22 00 00 00       	mov    $0x22,%eax
     557:	51                   	push   %ecx
     558:	53                   	push   %ebx
     559:	50                   	push   %eax
     55a:	cd 40                	int    $0x40
     55c:	85 c0                	test   %eax,%eax
     55e:	75 09                	jne    569 <f1>
     560:	ff d2                	call   *%edx
     562:	b8 02 00 00 00       	mov    $0x2,%eax
     567:	cd 40                	int    $0x40

00000569 <f1>:
      :"=a" (retval)
      :"0" (SYS_clone),"i" (SYS__exit),
      "r" (fn),
      "b" (stack),
      "c" (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_THREAD));
  if (retval < 0)
     569:	85 c0                	test   %eax,%eax
     56b:	78 23                	js     590 <f1+0x27>
  {
    errno = -retval;
    retval = -1;
  }
  return retval;
}
     56d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     570:	c9                   	leave  
     571:	c3                   	ret    
     572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    stack = (void*)malloc(STACKSIZE);
     578:	83 ec 0c             	sub    $0xc,%esp
     57b:	68 00 10 00 00       	push   $0x1000
     580:	e8 3b 0a 00 00       	call   fc0 <malloc>
    stack = (void*)(stack + STACKSIZE);
     585:	83 c4 10             	add    $0x10,%esp
     588:	8d 98 00 10 00 00    	lea    0x1000(%eax),%ebx
     58e:	eb b2                	jmp    542 <clone_fn+0x12>
    errno = -retval;
     590:	f7 d8                	neg    %eax
     592:	a3 0c 15 00 00       	mov    %eax,0x150c
    retval = -1;
     597:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return retval;
     59c:	eb cf                	jmp    56d <f1+0x4>
     59e:	66 90                	xchg   %ax,%ax

000005a0 <exit>:

int
exit(void)
{
     5a0:	f3 0f 1e fb          	endbr32 
     5a4:	55                   	push   %ebp
     5a5:	89 e5                	mov    %esp,%ebp
     5a7:	83 ec 08             	sub    $0x8,%esp
  exit_group();
     5aa:	e8 2e 05 00 00       	call   add <exit_group>

000005af <fork>:
    subl %eax, errno; \
    movl $-1, %eax; \
  ok_ ## name : \
    ret

SYSCALL(fork)
     5af:	b8 01 00 00 00       	mov    $0x1,%eax
     5b4:	cd 40                	int    $0x40
     5b6:	83 f8 00             	cmp    $0x0,%eax
     5b9:	7d 1a                	jge    5d5 <ok_fork>
     5bb:	83 f8 80             	cmp    $0xffffff80,%eax
     5be:	7c 15                	jl     5d5 <ok_fork>
     5c0:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     5c7:	00 00 00 
     5ca:	29 05 0c 15 00 00    	sub    %eax,0x150c
     5d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000005d5 <ok_fork>:
     5d5:	c3                   	ret    

000005d6 <_exit>:
SYSCALL(_exit)
     5d6:	b8 02 00 00 00       	mov    $0x2,%eax
     5db:	cd 40                	int    $0x40
     5dd:	83 f8 00             	cmp    $0x0,%eax
     5e0:	7d 1a                	jge    5fc <ok__exit>
     5e2:	83 f8 80             	cmp    $0xffffff80,%eax
     5e5:	7c 15                	jl     5fc <ok__exit>
     5e7:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     5ee:	00 00 00 
     5f1:	29 05 0c 15 00 00    	sub    %eax,0x150c
     5f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000005fc <ok__exit>:
     5fc:	c3                   	ret    

000005fd <wait>:
SYSCALL(wait)
     5fd:	b8 03 00 00 00       	mov    $0x3,%eax
     602:	cd 40                	int    $0x40
     604:	83 f8 00             	cmp    $0x0,%eax
     607:	7d 1a                	jge    623 <ok_wait>
     609:	83 f8 80             	cmp    $0xffffff80,%eax
     60c:	7c 15                	jl     623 <ok_wait>
     60e:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     615:	00 00 00 
     618:	29 05 0c 15 00 00    	sub    %eax,0x150c
     61e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000623 <ok_wait>:
     623:	c3                   	ret    

00000624 <pipe>:
SYSCALL(pipe)
     624:	b8 04 00 00 00       	mov    $0x4,%eax
     629:	cd 40                	int    $0x40
     62b:	83 f8 00             	cmp    $0x0,%eax
     62e:	7d 1a                	jge    64a <ok_pipe>
     630:	83 f8 80             	cmp    $0xffffff80,%eax
     633:	7c 15                	jl     64a <ok_pipe>
     635:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     63c:	00 00 00 
     63f:	29 05 0c 15 00 00    	sub    %eax,0x150c
     645:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000064a <ok_pipe>:
     64a:	c3                   	ret    

0000064b <read>:
SYSCALL(read)
     64b:	b8 05 00 00 00       	mov    $0x5,%eax
     650:	cd 40                	int    $0x40
     652:	83 f8 00             	cmp    $0x0,%eax
     655:	7d 1a                	jge    671 <ok_read>
     657:	83 f8 80             	cmp    $0xffffff80,%eax
     65a:	7c 15                	jl     671 <ok_read>
     65c:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     663:	00 00 00 
     666:	29 05 0c 15 00 00    	sub    %eax,0x150c
     66c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000671 <ok_read>:
     671:	c3                   	ret    

00000672 <write>:
SYSCALL(write)
     672:	b8 10 00 00 00       	mov    $0x10,%eax
     677:	cd 40                	int    $0x40
     679:	83 f8 00             	cmp    $0x0,%eax
     67c:	7d 1a                	jge    698 <ok_write>
     67e:	83 f8 80             	cmp    $0xffffff80,%eax
     681:	7c 15                	jl     698 <ok_write>
     683:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     68a:	00 00 00 
     68d:	29 05 0c 15 00 00    	sub    %eax,0x150c
     693:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000698 <ok_write>:
     698:	c3                   	ret    

00000699 <close>:
SYSCALL(close)
     699:	b8 15 00 00 00       	mov    $0x15,%eax
     69e:	cd 40                	int    $0x40
     6a0:	83 f8 00             	cmp    $0x0,%eax
     6a3:	7d 1a                	jge    6bf <ok_close>
     6a5:	83 f8 80             	cmp    $0xffffff80,%eax
     6a8:	7c 15                	jl     6bf <ok_close>
     6aa:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     6b1:	00 00 00 
     6b4:	29 05 0c 15 00 00    	sub    %eax,0x150c
     6ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000006bf <ok_close>:
     6bf:	c3                   	ret    

000006c0 <kill>:
SYSCALL(kill)
     6c0:	b8 06 00 00 00       	mov    $0x6,%eax
     6c5:	cd 40                	int    $0x40
     6c7:	83 f8 00             	cmp    $0x0,%eax
     6ca:	7d 1a                	jge    6e6 <ok_kill>
     6cc:	83 f8 80             	cmp    $0xffffff80,%eax
     6cf:	7c 15                	jl     6e6 <ok_kill>
     6d1:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     6d8:	00 00 00 
     6db:	29 05 0c 15 00 00    	sub    %eax,0x150c
     6e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000006e6 <ok_kill>:
     6e6:	c3                   	ret    

000006e7 <execve>:
SYSCALL(execve)
     6e7:	b8 07 00 00 00       	mov    $0x7,%eax
     6ec:	cd 40                	int    $0x40
     6ee:	83 f8 00             	cmp    $0x0,%eax
     6f1:	7d 1a                	jge    70d <ok_execve>
     6f3:	83 f8 80             	cmp    $0xffffff80,%eax
     6f6:	7c 15                	jl     70d <ok_execve>
     6f8:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     6ff:	00 00 00 
     702:	29 05 0c 15 00 00    	sub    %eax,0x150c
     708:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000070d <ok_execve>:
     70d:	c3                   	ret    

0000070e <open>:
SYSCALL(open)
     70e:	b8 0f 00 00 00       	mov    $0xf,%eax
     713:	cd 40                	int    $0x40
     715:	83 f8 00             	cmp    $0x0,%eax
     718:	7d 1a                	jge    734 <ok_open>
     71a:	83 f8 80             	cmp    $0xffffff80,%eax
     71d:	7c 15                	jl     734 <ok_open>
     71f:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     726:	00 00 00 
     729:	29 05 0c 15 00 00    	sub    %eax,0x150c
     72f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000734 <ok_open>:
     734:	c3                   	ret    

00000735 <mknod>:
SYSCALL(mknod)
     735:	b8 11 00 00 00       	mov    $0x11,%eax
     73a:	cd 40                	int    $0x40
     73c:	83 f8 00             	cmp    $0x0,%eax
     73f:	7d 1a                	jge    75b <ok_mknod>
     741:	83 f8 80             	cmp    $0xffffff80,%eax
     744:	7c 15                	jl     75b <ok_mknod>
     746:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     74d:	00 00 00 
     750:	29 05 0c 15 00 00    	sub    %eax,0x150c
     756:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000075b <ok_mknod>:
     75b:	c3                   	ret    

0000075c <mkfifo>:
SYSCALL(mkfifo)
     75c:	b8 16 00 00 00       	mov    $0x16,%eax
     761:	cd 40                	int    $0x40
     763:	83 f8 00             	cmp    $0x0,%eax
     766:	7d 1a                	jge    782 <ok_mkfifo>
     768:	83 f8 80             	cmp    $0xffffff80,%eax
     76b:	7c 15                	jl     782 <ok_mkfifo>
     76d:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     774:	00 00 00 
     777:	29 05 0c 15 00 00    	sub    %eax,0x150c
     77d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000782 <ok_mkfifo>:
     782:	c3                   	ret    

00000783 <unlink>:
SYSCALL(unlink)
     783:	b8 12 00 00 00       	mov    $0x12,%eax
     788:	cd 40                	int    $0x40
     78a:	83 f8 00             	cmp    $0x0,%eax
     78d:	7d 1a                	jge    7a9 <ok_unlink>
     78f:	83 f8 80             	cmp    $0xffffff80,%eax
     792:	7c 15                	jl     7a9 <ok_unlink>
     794:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     79b:	00 00 00 
     79e:	29 05 0c 15 00 00    	sub    %eax,0x150c
     7a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000007a9 <ok_unlink>:
     7a9:	c3                   	ret    

000007aa <fstat>:
SYSCALL(fstat)
     7aa:	b8 08 00 00 00       	mov    $0x8,%eax
     7af:	cd 40                	int    $0x40
     7b1:	83 f8 00             	cmp    $0x0,%eax
     7b4:	7d 1a                	jge    7d0 <ok_fstat>
     7b6:	83 f8 80             	cmp    $0xffffff80,%eax
     7b9:	7c 15                	jl     7d0 <ok_fstat>
     7bb:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     7c2:	00 00 00 
     7c5:	29 05 0c 15 00 00    	sub    %eax,0x150c
     7cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000007d0 <ok_fstat>:
     7d0:	c3                   	ret    

000007d1 <link>:
SYSCALL(link)
     7d1:	b8 13 00 00 00       	mov    $0x13,%eax
     7d6:	cd 40                	int    $0x40
     7d8:	83 f8 00             	cmp    $0x0,%eax
     7db:	7d 1a                	jge    7f7 <ok_link>
     7dd:	83 f8 80             	cmp    $0xffffff80,%eax
     7e0:	7c 15                	jl     7f7 <ok_link>
     7e2:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     7e9:	00 00 00 
     7ec:	29 05 0c 15 00 00    	sub    %eax,0x150c
     7f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000007f7 <ok_link>:
     7f7:	c3                   	ret    

000007f8 <mkdir>:
SYSCALL(mkdir)
     7f8:	b8 14 00 00 00       	mov    $0x14,%eax
     7fd:	cd 40                	int    $0x40
     7ff:	83 f8 00             	cmp    $0x0,%eax
     802:	7d 1a                	jge    81e <ok_mkdir>
     804:	83 f8 80             	cmp    $0xffffff80,%eax
     807:	7c 15                	jl     81e <ok_mkdir>
     809:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     810:	00 00 00 
     813:	29 05 0c 15 00 00    	sub    %eax,0x150c
     819:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000081e <ok_mkdir>:
     81e:	c3                   	ret    

0000081f <chdir>:
SYSCALL(chdir)
     81f:	b8 09 00 00 00       	mov    $0x9,%eax
     824:	cd 40                	int    $0x40
     826:	83 f8 00             	cmp    $0x0,%eax
     829:	7d 1a                	jge    845 <ok_chdir>
     82b:	83 f8 80             	cmp    $0xffffff80,%eax
     82e:	7c 15                	jl     845 <ok_chdir>
     830:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     837:	00 00 00 
     83a:	29 05 0c 15 00 00    	sub    %eax,0x150c
     840:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000845 <ok_chdir>:
     845:	c3                   	ret    

00000846 <dup>:
SYSCALL(dup)
     846:	b8 0a 00 00 00       	mov    $0xa,%eax
     84b:	cd 40                	int    $0x40
     84d:	83 f8 00             	cmp    $0x0,%eax
     850:	7d 1a                	jge    86c <ok_dup>
     852:	83 f8 80             	cmp    $0xffffff80,%eax
     855:	7c 15                	jl     86c <ok_dup>
     857:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     85e:	00 00 00 
     861:	29 05 0c 15 00 00    	sub    %eax,0x150c
     867:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000086c <ok_dup>:
     86c:	c3                   	ret    

0000086d <getpid>:
SYSCALL(getpid)
     86d:	b8 0b 00 00 00       	mov    $0xb,%eax
     872:	cd 40                	int    $0x40
     874:	83 f8 00             	cmp    $0x0,%eax
     877:	7d 1a                	jge    893 <ok_getpid>
     879:	83 f8 80             	cmp    $0xffffff80,%eax
     87c:	7c 15                	jl     893 <ok_getpid>
     87e:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     885:	00 00 00 
     888:	29 05 0c 15 00 00    	sub    %eax,0x150c
     88e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000893 <ok_getpid>:
     893:	c3                   	ret    

00000894 <sbrk>:
SYSCALL(sbrk)
     894:	b8 0c 00 00 00       	mov    $0xc,%eax
     899:	cd 40                	int    $0x40
     89b:	83 f8 00             	cmp    $0x0,%eax
     89e:	7d 1a                	jge    8ba <ok_sbrk>
     8a0:	83 f8 80             	cmp    $0xffffff80,%eax
     8a3:	7c 15                	jl     8ba <ok_sbrk>
     8a5:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     8ac:	00 00 00 
     8af:	29 05 0c 15 00 00    	sub    %eax,0x150c
     8b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000008ba <ok_sbrk>:
     8ba:	c3                   	ret    

000008bb <sleep>:
SYSCALL(sleep)
     8bb:	b8 0d 00 00 00       	mov    $0xd,%eax
     8c0:	cd 40                	int    $0x40
     8c2:	83 f8 00             	cmp    $0x0,%eax
     8c5:	7d 1a                	jge    8e1 <ok_sleep>
     8c7:	83 f8 80             	cmp    $0xffffff80,%eax
     8ca:	7c 15                	jl     8e1 <ok_sleep>
     8cc:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     8d3:	00 00 00 
     8d6:	29 05 0c 15 00 00    	sub    %eax,0x150c
     8dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000008e1 <ok_sleep>:
     8e1:	c3                   	ret    

000008e2 <uptime>:
SYSCALL(uptime)
     8e2:	b8 0e 00 00 00       	mov    $0xe,%eax
     8e7:	cd 40                	int    $0x40
     8e9:	83 f8 00             	cmp    $0x0,%eax
     8ec:	7d 1a                	jge    908 <ok_uptime>
     8ee:	83 f8 80             	cmp    $0xffffff80,%eax
     8f1:	7c 15                	jl     908 <ok_uptime>
     8f3:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     8fa:	00 00 00 
     8fd:	29 05 0c 15 00 00    	sub    %eax,0x150c
     903:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000908 <ok_uptime>:
     908:	c3                   	ret    

00000909 <umask>:
SYSCALL(umask)
     909:	b8 17 00 00 00       	mov    $0x17,%eax
     90e:	cd 40                	int    $0x40
     910:	83 f8 00             	cmp    $0x0,%eax
     913:	7d 1a                	jge    92f <ok_umask>
     915:	83 f8 80             	cmp    $0xffffff80,%eax
     918:	7c 15                	jl     92f <ok_umask>
     91a:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     921:	00 00 00 
     924:	29 05 0c 15 00 00    	sub    %eax,0x150c
     92a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000092f <ok_umask>:
     92f:	c3                   	ret    

00000930 <setreuid>:
SYSCALL(setreuid)
     930:	b8 18 00 00 00       	mov    $0x18,%eax
     935:	cd 40                	int    $0x40
     937:	83 f8 00             	cmp    $0x0,%eax
     93a:	7d 1a                	jge    956 <ok_setreuid>
     93c:	83 f8 80             	cmp    $0xffffff80,%eax
     93f:	7c 15                	jl     956 <ok_setreuid>
     941:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     948:	00 00 00 
     94b:	29 05 0c 15 00 00    	sub    %eax,0x150c
     951:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000956 <ok_setreuid>:
     956:	c3                   	ret    

00000957 <setregid>:
SYSCALL(setregid)
     957:	b8 19 00 00 00       	mov    $0x19,%eax
     95c:	cd 40                	int    $0x40
     95e:	83 f8 00             	cmp    $0x0,%eax
     961:	7d 1a                	jge    97d <ok_setregid>
     963:	83 f8 80             	cmp    $0xffffff80,%eax
     966:	7c 15                	jl     97d <ok_setregid>
     968:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     96f:	00 00 00 
     972:	29 05 0c 15 00 00    	sub    %eax,0x150c
     978:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000097d <ok_setregid>:
     97d:	c3                   	ret    

0000097e <getuid>:
SYSCALL(getuid)
     97e:	b8 1a 00 00 00       	mov    $0x1a,%eax
     983:	cd 40                	int    $0x40
     985:	83 f8 00             	cmp    $0x0,%eax
     988:	7d 1a                	jge    9a4 <ok_getuid>
     98a:	83 f8 80             	cmp    $0xffffff80,%eax
     98d:	7c 15                	jl     9a4 <ok_getuid>
     98f:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     996:	00 00 00 
     999:	29 05 0c 15 00 00    	sub    %eax,0x150c
     99f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000009a4 <ok_getuid>:
     9a4:	c3                   	ret    

000009a5 <geteuid>:
SYSCALL(geteuid)
     9a5:	b8 1b 00 00 00       	mov    $0x1b,%eax
     9aa:	cd 40                	int    $0x40
     9ac:	83 f8 00             	cmp    $0x0,%eax
     9af:	7d 1a                	jge    9cb <ok_geteuid>
     9b1:	83 f8 80             	cmp    $0xffffff80,%eax
     9b4:	7c 15                	jl     9cb <ok_geteuid>
     9b6:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     9bd:	00 00 00 
     9c0:	29 05 0c 15 00 00    	sub    %eax,0x150c
     9c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000009cb <ok_geteuid>:
     9cb:	c3                   	ret    

000009cc <getgid>:
SYSCALL(getgid)
     9cc:	b8 1c 00 00 00       	mov    $0x1c,%eax
     9d1:	cd 40                	int    $0x40
     9d3:	83 f8 00             	cmp    $0x0,%eax
     9d6:	7d 1a                	jge    9f2 <ok_getgid>
     9d8:	83 f8 80             	cmp    $0xffffff80,%eax
     9db:	7c 15                	jl     9f2 <ok_getgid>
     9dd:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     9e4:	00 00 00 
     9e7:	29 05 0c 15 00 00    	sub    %eax,0x150c
     9ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000009f2 <ok_getgid>:
     9f2:	c3                   	ret    

000009f3 <getegid>:
SYSCALL(getegid)
     9f3:	b8 1d 00 00 00       	mov    $0x1d,%eax
     9f8:	cd 40                	int    $0x40
     9fa:	83 f8 00             	cmp    $0x0,%eax
     9fd:	7d 1a                	jge    a19 <ok_getegid>
     9ff:	83 f8 80             	cmp    $0xffffff80,%eax
     a02:	7c 15                	jl     a19 <ok_getegid>
     a04:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     a0b:	00 00 00 
     a0e:	29 05 0c 15 00 00    	sub    %eax,0x150c
     a14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a19 <ok_getegid>:
     a19:	c3                   	ret    

00000a1a <chmod>:
SYSCALL(chmod)
     a1a:	b8 1e 00 00 00       	mov    $0x1e,%eax
     a1f:	cd 40                	int    $0x40
     a21:	83 f8 00             	cmp    $0x0,%eax
     a24:	7d 1a                	jge    a40 <ok_chmod>
     a26:	83 f8 80             	cmp    $0xffffff80,%eax
     a29:	7c 15                	jl     a40 <ok_chmod>
     a2b:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     a32:	00 00 00 
     a35:	29 05 0c 15 00 00    	sub    %eax,0x150c
     a3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a40 <ok_chmod>:
     a40:	c3                   	ret    

00000a41 <chown>:
SYSCALL(chown)
     a41:	b8 1f 00 00 00       	mov    $0x1f,%eax
     a46:	cd 40                	int    $0x40
     a48:	83 f8 00             	cmp    $0x0,%eax
     a4b:	7d 1a                	jge    a67 <ok_chown>
     a4d:	83 f8 80             	cmp    $0xffffff80,%eax
     a50:	7c 15                	jl     a67 <ok_chown>
     a52:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     a59:	00 00 00 
     a5c:	29 05 0c 15 00 00    	sub    %eax,0x150c
     a62:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a67 <ok_chown>:
     a67:	c3                   	ret    

00000a68 <setgroups>:
SYSCALL(setgroups)
     a68:	b8 20 00 00 00       	mov    $0x20,%eax
     a6d:	cd 40                	int    $0x40
     a6f:	83 f8 00             	cmp    $0x0,%eax
     a72:	7d 1a                	jge    a8e <ok_setgroups>
     a74:	83 f8 80             	cmp    $0xffffff80,%eax
     a77:	7c 15                	jl     a8e <ok_setgroups>
     a79:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     a80:	00 00 00 
     a83:	29 05 0c 15 00 00    	sub    %eax,0x150c
     a89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a8e <ok_setgroups>:
     a8e:	c3                   	ret    

00000a8f <getgroups>:
SYSCALL(getgroups)
     a8f:	b8 21 00 00 00       	mov    $0x21,%eax
     a94:	cd 40                	int    $0x40
     a96:	83 f8 00             	cmp    $0x0,%eax
     a99:	7d 1a                	jge    ab5 <ok_getgroups>
     a9b:	83 f8 80             	cmp    $0xffffff80,%eax
     a9e:	7c 15                	jl     ab5 <ok_getgroups>
     aa0:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     aa7:	00 00 00 
     aaa:	29 05 0c 15 00 00    	sub    %eax,0x150c
     ab0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000ab5 <ok_getgroups>:
     ab5:	c3                   	ret    

00000ab6 <clone>:
SYSCALL(clone)
     ab6:	b8 22 00 00 00       	mov    $0x22,%eax
     abb:	cd 40                	int    $0x40
     abd:	83 f8 00             	cmp    $0x0,%eax
     ac0:	7d 1a                	jge    adc <ok_clone>
     ac2:	83 f8 80             	cmp    $0xffffff80,%eax
     ac5:	7c 15                	jl     adc <ok_clone>
     ac7:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     ace:	00 00 00 
     ad1:	29 05 0c 15 00 00    	sub    %eax,0x150c
     ad7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000adc <ok_clone>:
     adc:	c3                   	ret    

00000add <exit_group>:
SYSCALL(exit_group)
     add:	b8 23 00 00 00       	mov    $0x23,%eax
     ae2:	cd 40                	int    $0x40
     ae4:	83 f8 00             	cmp    $0x0,%eax
     ae7:	7d 1a                	jge    b03 <ok_exit_group>
     ae9:	83 f8 80             	cmp    $0xffffff80,%eax
     aec:	7c 15                	jl     b03 <ok_exit_group>
     aee:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     af5:	00 00 00 
     af8:	29 05 0c 15 00 00    	sub    %eax,0x150c
     afe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b03 <ok_exit_group>:
     b03:	c3                   	ret    

00000b04 <sched_yield>:
SYSCALL(sched_yield)
     b04:	b8 24 00 00 00       	mov    $0x24,%eax
     b09:	cd 40                	int    $0x40
     b0b:	83 f8 00             	cmp    $0x0,%eax
     b0e:	7d 1a                	jge    b2a <ok_sched_yield>
     b10:	83 f8 80             	cmp    $0xffffff80,%eax
     b13:	7c 15                	jl     b2a <ok_sched_yield>
     b15:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     b1c:	00 00 00 
     b1f:	29 05 0c 15 00 00    	sub    %eax,0x150c
     b25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b2a <ok_sched_yield>:
     b2a:	c3                   	ret    

00000b2b <mount>:
SYSCALL(mount)
     b2b:	b8 25 00 00 00       	mov    $0x25,%eax
     b30:	cd 40                	int    $0x40
     b32:	83 f8 00             	cmp    $0x0,%eax
     b35:	7d 1a                	jge    b51 <ok_mount>
     b37:	83 f8 80             	cmp    $0xffffff80,%eax
     b3a:	7c 15                	jl     b51 <ok_mount>
     b3c:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     b43:	00 00 00 
     b46:	29 05 0c 15 00 00    	sub    %eax,0x150c
     b4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b51 <ok_mount>:
     b51:	c3                   	ret    

00000b52 <chroot>:
SYSCALL(chroot)
     b52:	b8 26 00 00 00       	mov    $0x26,%eax
     b57:	cd 40                	int    $0x40
     b59:	83 f8 00             	cmp    $0x0,%eax
     b5c:	7d 1a                	jge    b78 <ok_chroot>
     b5e:	83 f8 80             	cmp    $0xffffff80,%eax
     b61:	7c 15                	jl     b78 <ok_chroot>
     b63:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     b6a:	00 00 00 
     b6d:	29 05 0c 15 00 00    	sub    %eax,0x150c
     b73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b78 <ok_chroot>:
     b78:	c3                   	ret    

00000b79 <mmap>:
SYSCALL(mmap)
     b79:	b8 27 00 00 00       	mov    $0x27,%eax
     b7e:	cd 40                	int    $0x40
     b80:	83 f8 00             	cmp    $0x0,%eax
     b83:	7d 1a                	jge    b9f <ok_mmap>
     b85:	83 f8 80             	cmp    $0xffffff80,%eax
     b88:	7c 15                	jl     b9f <ok_mmap>
     b8a:	c7 05 0c 15 00 00 00 	movl   $0x0,0x150c
     b91:	00 00 00 
     b94:	29 05 0c 15 00 00    	sub    %eax,0x150c
     b9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b9f <ok_mmap>:
     b9f:	c3                   	ret    

00000ba0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn, int width, char padding_char)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	57                   	push   %edi
     ba4:	56                   	push   %esi
     ba5:	53                   	push   %ebx
     ba6:	83 ec 4c             	sub    $0x4c,%esp
     ba9:	89 45 bc             	mov    %eax,-0x44(%ebp)
     bac:	0f b6 45 10          	movzbl 0x10(%ebp),%eax
     bb0:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     bb3:	89 d1                	mov    %edx,%ecx
{
     bb5:	88 45 ba             	mov    %al,-0x46(%ebp)
  if(sgn && xx < 0){
     bb8:	85 d2                	test   %edx,%edx
     bba:	0f 89 e0 00 00 00    	jns    ca0 <printint+0x100>
     bc0:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     bc4:	0f 84 d6 00 00 00    	je     ca0 <printint+0x100>
    neg = 1;
     bca:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
    x = -xx;
     bd1:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     bd3:	31 f6                	xor    %esi,%esi
     bd5:	8d 7d d7             	lea    -0x29(%ebp),%edi
     bd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bdf:	90                   	nop
  do{
    buf[i++] = digits[x % base];
     be0:	89 c8                	mov    %ecx,%eax
     be2:	31 d2                	xor    %edx,%edx
     be4:	89 75 c0             	mov    %esi,-0x40(%ebp)
     be7:	83 c6 01             	add    $0x1,%esi
     bea:	f7 75 c4             	divl   -0x3c(%ebp)
     bed:	89 cb                	mov    %ecx,%ebx
     bef:	0f b6 92 d8 10 00 00 	movzbl 0x10d8(%edx),%edx
  }while((x /= base) != 0);
     bf6:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
     bf8:	88 14 37             	mov    %dl,(%edi,%esi,1)
  }while((x /= base) != 0);
     bfb:	39 5d c4             	cmp    %ebx,-0x3c(%ebp)
     bfe:	76 e0                	jbe    be0 <printint+0x40>
  if(neg)
     c00:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     c03:	8b 5d c0             	mov    -0x40(%ebp),%ebx
     c06:	88 55 bb             	mov    %dl,-0x45(%ebp)
     c09:	85 c0                	test   %eax,%eax
     c0b:	74 10                	je     c1d <printint+0x7d>
    buf[i++] = '-';
     c0d:	c6 45 bb 2d          	movb   $0x2d,-0x45(%ebp)
     c11:	8d 43 02             	lea    0x2(%ebx),%eax
    buf[i++] = digits[x % base];
     c14:	89 f3                	mov    %esi,%ebx
    buf[i++] = '-';
     c16:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
     c1b:	89 c6                	mov    %eax,%esi
  k = width;
  while(--k >= i)
     c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c20:	8d 50 ff             	lea    -0x1(%eax),%edx
     c23:	8d 46 ff             	lea    -0x1(%esi),%eax
     c26:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     c29:	39 d6                	cmp    %edx,%esi
     c2b:	0f 8f 7f 00 00 00    	jg     cb0 <printint+0x110>
     c31:	89 5d c0             	mov    %ebx,-0x40(%ebp)
     c34:	0f b6 5d ba          	movzbl -0x46(%ebp),%ebx
     c38:	89 d6                	mov    %edx,%esi
     c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     c40:	83 ec 04             	sub    $0x4,%esp
     c43:	88 5d d7             	mov    %bl,-0x29(%ebp)
  while(--k >= i)
     c46:	83 ee 01             	sub    $0x1,%esi
  write(fd, &c, 1);
     c49:	6a 01                	push   $0x1
     c4b:	57                   	push   %edi
     c4c:	ff 75 bc             	pushl  -0x44(%ebp)
     c4f:	e8 1e fa ff ff       	call   672 <write>
  while(--k >= i)
     c54:	83 c4 10             	add    $0x10,%esp
     c57:	3b 75 c4             	cmp    -0x3c(%ebp),%esi
     c5a:	75 e4                	jne    c40 <printint+0xa0>
     c5c:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
     c60:	8b 5d c0             	mov    -0x40(%ebp),%ebx
     c63:	8b 75 bc             	mov    -0x44(%ebp),%esi
     c66:	eb 0d                	jmp    c75 <printint+0xd5>
     c68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c6f:	90                   	nop
     c70:	0f b6 44 1d d8       	movzbl -0x28(%ebp,%ebx,1),%eax
  write(fd, &c, 1);
     c75:	83 ec 04             	sub    $0x4,%esp
    putc(fd, padding_char);

  while(--i >= 0)
     c78:	83 eb 01             	sub    $0x1,%ebx
     c7b:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
     c7e:	6a 01                	push   $0x1
     c80:	57                   	push   %edi
     c81:	56                   	push   %esi
     c82:	e8 eb f9 ff ff       	call   672 <write>
  while(--i >= 0)
     c87:	83 c4 10             	add    $0x10,%esp
     c8a:	83 fb ff             	cmp    $0xffffffff,%ebx
     c8d:	75 e1                	jne    c70 <printint+0xd0>
    putc(fd, buf[i]);
}
     c8f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c92:	5b                   	pop    %ebx
     c93:	5e                   	pop    %esi
     c94:	5f                   	pop    %edi
     c95:	5d                   	pop    %ebp
     c96:	c3                   	ret    
     c97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c9e:	66 90                	xchg   %ax,%ax
  neg = 0;
     ca0:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
     ca7:	e9 27 ff ff ff       	jmp    bd3 <printint+0x33>
     cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cb0:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
     cb4:	8b 75 bc             	mov    -0x44(%ebp),%esi
     cb7:	eb bc                	jmp    c75 <printint+0xd5>
     cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     cc0:	f3 0f 1e fb          	endbr32 
     cc4:	55                   	push   %ebp
     cc5:	89 e5                	mov    %esp,%ebp
     cc7:	57                   	push   %edi
     cc8:	56                   	push   %esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     cc9:	8d 75 10             	lea    0x10(%ebp),%esi
{
     ccc:	53                   	push   %ebx
     ccd:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
     cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  ap = (uint*)(void*)&fmt + 1;
     cd3:	89 75 c8             	mov    %esi,-0x38(%ebp)
  for(i = 0; fmt[i]; i++){
     cd6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     cd9:	0f b6 00             	movzbl (%eax),%eax
     cdc:	84 c0                	test   %al,%al
     cde:	74 5e                	je     d3e <printf+0x7e>
     ce0:	31 c9                	xor    %ecx,%ecx
     ce2:	31 db                	xor    %ebx,%ebx
     ce4:	eb 3b                	jmp    d21 <printf+0x61>
     ce6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ced:	8d 76 00             	lea    0x0(%esi),%esi
     cf0:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     cf3:	83 fe 25             	cmp    $0x25,%esi
     cf6:	74 58                	je     d50 <printf+0x90>
  write(fd, &c, 1);
     cf8:	83 ec 04             	sub    $0x4,%esp
     cfb:	88 45 e7             	mov    %al,-0x19(%ebp)
     cfe:	8d 45 e7             	lea    -0x19(%ebp),%eax
     d01:	6a 01                	push   $0x1
     d03:	50                   	push   %eax
     d04:	ff 75 08             	pushl  0x8(%ebp)
     d07:	89 55 cc             	mov    %edx,-0x34(%ebp)
     d0a:	e8 63 f9 ff ff       	call   672 <write>
        state = '%';
      } else {
        putc(fd, c);
     d0f:	8b 55 cc             	mov    -0x34(%ebp),%edx
     d12:	8b 4d d0             	mov    -0x30(%ebp),%ecx
     d15:	83 c4 10             	add    $0x10,%esp
     d18:	89 d3                	mov    %edx,%ebx
  for(i = 0; fmt[i]; i++){
     d1a:	0f b6 07             	movzbl (%edi),%eax
     d1d:	84 c0                	test   %al,%al
     d1f:	74 1d                	je     d3e <printf+0x7e>
    c = fmt[i] & 0xff;
     d21:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     d24:	8d 53 01             	lea    0x1(%ebx),%edx
     d27:	0f b6 f0             	movzbl %al,%esi
    if(state == 0){
     d2a:	01 d7                	add    %edx,%edi
     d2c:	85 c9                	test   %ecx,%ecx
     d2e:	74 c0                	je     cf0 <printf+0x30>
      }
    } else if(state == '%'){
     d30:	83 f9 25             	cmp    $0x25,%ecx
     d33:	74 2b                	je     d60 <printf+0xa0>
  for(i = 0; fmt[i]; i++){
     d35:	0f b6 07             	movzbl (%edi),%eax
     d38:	89 d3                	mov    %edx,%ebx
     d3a:	84 c0                	test   %al,%al
     d3c:	75 e3                	jne    d21 <printf+0x61>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     d3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d41:	5b                   	pop    %ebx
     d42:	5e                   	pop    %esi
     d43:	5f                   	pop    %edi
     d44:	5d                   	pop    %ebp
     d45:	c3                   	ret    
     d46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d4d:	8d 76 00             	lea    0x0(%esi),%esi
     d50:	89 d3                	mov    %edx,%ebx
        state = '%';
     d52:	b9 25 00 00 00       	mov    $0x25,%ecx
     d57:	eb c1                	jmp    d1a <printf+0x5a>
     d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      char padding_char = ' ';
     d60:	c6 45 d0 20          	movb   $0x20,-0x30(%ebp)
      if(c == '0'){
     d64:	83 fe 30             	cmp    $0x30,%esi
     d67:	0f 84 a3 00 00 00    	je     e10 <printf+0x150>
      while('0' <= c && c <= '9'){
     d6d:	8d 46 d0             	lea    -0x30(%esi),%eax
     d70:	83 f8 09             	cmp    $0x9,%eax
     d73:	0f 87 f9 00 00 00    	ja     e72 <printf+0x1b2>
      int width = 0;
     d79:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     d7c:	31 d2                	xor    %edx,%edx
     d7e:	66 90                	xchg   %ax,%ax
        width *= 10;
     d80:	89 d9                	mov    %ebx,%ecx
        i++;
     d82:	83 c3 01             	add    $0x1,%ebx
        width *= 10;
     d85:	8d 14 92             	lea    (%edx,%edx,4),%edx
        c = fmt[i] & 0xff;
     d88:	0f b6 34 1f          	movzbl (%edi,%ebx,1),%esi
        width += c - '0';
     d8c:	8d 14 50             	lea    (%eax,%edx,2),%edx
      while('0' <= c && c <= '9'){
     d8f:	8d 46 d0             	lea    -0x30(%esi),%eax
     d92:	83 f8 09             	cmp    $0x9,%eax
     d95:	76 e9                	jbe    d80 <printf+0xc0>
     d97:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     d9a:	8d 59 02             	lea    0x2(%ecx),%ebx
     d9d:	8d 3c 18             	lea    (%eax,%ebx,1),%edi
      if(c == 'd'){
     da0:	83 fe 64             	cmp    $0x64,%esi
     da3:	0f 84 b7 00 00 00    	je     e60 <printf+0x1a0>
      } else if(c == 'x' || c == 'p'){
     da9:	89 f0                	mov    %esi,%eax
     dab:	83 e0 f7             	and    $0xfffffff7,%eax
     dae:	83 f8 70             	cmp    $0x70,%eax
     db1:	74 7d                	je     e30 <printf+0x170>
      } else if(c == 'o'){
     db3:	83 fe 6f             	cmp    $0x6f,%esi
     db6:	0f 84 bf 00 00 00    	je     e7b <printf+0x1bb>
      } else if(c == 's'){
     dbc:	83 fe 73             	cmp    $0x73,%esi
     dbf:	0f 84 f9 00 00 00    	je     ebe <printf+0x1fe>
      } else if(c == 'c'){
     dc5:	83 fe 63             	cmp    $0x63,%esi
     dc8:	0f 84 c7 00 00 00    	je     e95 <printf+0x1d5>
      } else if(c == '%'){
     dce:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     dd2:	83 fe 25             	cmp    $0x25,%esi
     dd5:	0f 84 b2 00 00 00    	je     e8d <printf+0x1cd>
  write(fd, &c, 1);
     ddb:	83 ec 04             	sub    $0x4,%esp
     dde:	8d 45 e7             	lea    -0x19(%ebp),%eax
     de1:	6a 01                	push   $0x1
     de3:	50                   	push   %eax
     de4:	ff 75 08             	pushl  0x8(%ebp)
     de7:	e8 86 f8 ff ff       	call   672 <write>
        putc(fd, c);
     dec:	89 f0                	mov    %esi,%eax
  write(fd, &c, 1);
     dee:	83 c4 0c             	add    $0xc,%esp
        putc(fd, c);
     df1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     df4:	8d 45 e7             	lea    -0x19(%ebp),%eax
     df7:	6a 01                	push   $0x1
     df9:	50                   	push   %eax
     dfa:	ff 75 08             	pushl  0x8(%ebp)
     dfd:	e8 70 f8 ff ff       	call   672 <write>
        putc(fd, c);
     e02:	83 c4 10             	add    $0x10,%esp
      state = 0;
     e05:	31 c9                	xor    %ecx,%ecx
     e07:	e9 0e ff ff ff       	jmp    d1a <printf+0x5a>
     e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        c = fmt[i] & 0xff;
     e10:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     e13:	8d 43 02             	lea    0x2(%ebx),%eax
     e16:	0f b6 37             	movzbl (%edi),%esi
        i++;
     e19:	89 d3                	mov    %edx,%ebx
        padding_char = '0';
     e1b:	c6 45 d0 30          	movb   $0x30,-0x30(%ebp)
        c = fmt[i] & 0xff;
     e1f:	89 c2                	mov    %eax,%edx
     e21:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
     e24:	e9 44 ff ff ff       	jmp    d6d <printf+0xad>
     e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0, width, padding_char);
     e30:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
     e34:	83 ec 04             	sub    $0x4,%esp
     e37:	b9 10 00 00 00       	mov    $0x10,%ecx
     e3c:	50                   	push   %eax
     e3d:	52                   	push   %edx
     e3e:	6a 00                	push   $0x0
        printint(fd, *ap, 8, 0, width, padding_char);
     e40:	8b 75 c8             	mov    -0x38(%ebp),%esi
     e43:	8b 45 08             	mov    0x8(%ebp),%eax
     e46:	8b 16                	mov    (%esi),%edx
     e48:	e8 53 fd ff ff       	call   ba0 <printint>
        ap++;
     e4d:	89 f0                	mov    %esi,%eax
     e4f:	83 c4 10             	add    $0x10,%esp
      state = 0;
     e52:	31 c9                	xor    %ecx,%ecx
        ap++;
     e54:	83 c0 04             	add    $0x4,%eax
     e57:	89 45 c8             	mov    %eax,-0x38(%ebp)
     e5a:	e9 bb fe ff ff       	jmp    d1a <printf+0x5a>
     e5f:	90                   	nop
        printint(fd, *ap, 10, 1, width, padding_char);
     e60:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
     e64:	83 ec 04             	sub    $0x4,%esp
     e67:	b9 0a 00 00 00       	mov    $0xa,%ecx
     e6c:	50                   	push   %eax
     e6d:	52                   	push   %edx
     e6e:	6a 01                	push   $0x1
     e70:	eb ce                	jmp    e40 <printf+0x180>
      while('0' <= c && c <= '9'){
     e72:	89 d3                	mov    %edx,%ebx
      int width = 0;
     e74:	31 d2                	xor    %edx,%edx
     e76:	e9 25 ff ff ff       	jmp    da0 <printf+0xe0>
        printint(fd, *ap, 8, 0, width, padding_char);
     e7b:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
     e7f:	83 ec 04             	sub    $0x4,%esp
     e82:	b9 08 00 00 00       	mov    $0x8,%ecx
     e87:	50                   	push   %eax
     e88:	52                   	push   %edx
     e89:	6a 00                	push   $0x0
     e8b:	eb b3                	jmp    e40 <printf+0x180>
  write(fd, &c, 1);
     e8d:	83 ec 04             	sub    $0x4,%esp
     e90:	e9 5f ff ff ff       	jmp    df4 <printf+0x134>
        putc(fd, *ap);
     e95:	8b 75 c8             	mov    -0x38(%ebp),%esi
  write(fd, &c, 1);
     e98:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     e9b:	8b 06                	mov    (%esi),%eax
  write(fd, &c, 1);
     e9d:	6a 01                	push   $0x1
        ap++;
     e9f:	83 c6 04             	add    $0x4,%esi
        putc(fd, *ap);
     ea2:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     ea5:	8d 45 e7             	lea    -0x19(%ebp),%eax
     ea8:	50                   	push   %eax
     ea9:	ff 75 08             	pushl  0x8(%ebp)
     eac:	e8 c1 f7 ff ff       	call   672 <write>
        ap++;
     eb1:	89 75 c8             	mov    %esi,-0x38(%ebp)
     eb4:	83 c4 10             	add    $0x10,%esp
      state = 0;
     eb7:	31 c9                	xor    %ecx,%ecx
     eb9:	e9 5c fe ff ff       	jmp    d1a <printf+0x5a>
        s = (char*)*ap;
     ebe:	8b 45 c8             	mov    -0x38(%ebp),%eax
     ec1:	8b 30                	mov    (%eax),%esi
        ap++;
     ec3:	83 c0 04             	add    $0x4,%eax
     ec6:	89 45 c8             	mov    %eax,-0x38(%ebp)
        if(s == 0)
     ec9:	85 f6                	test   %esi,%esi
     ecb:	74 44                	je     f11 <printf+0x251>
        while(*s != 0){
     ecd:	0f b6 06             	movzbl (%esi),%eax
      state = 0;
     ed0:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
     ed2:	84 c0                	test   %al,%al
     ed4:	0f 84 40 fe ff ff    	je     d1a <printf+0x5a>
     eda:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     edd:	89 f3                	mov    %esi,%ebx
     edf:	8b 75 08             	mov    0x8(%ebp),%esi
     ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     ee8:	83 ec 04             	sub    $0x4,%esp
     eeb:	88 45 e7             	mov    %al,-0x19(%ebp)
     eee:	8d 45 e7             	lea    -0x19(%ebp),%eax
          s++;
     ef1:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     ef4:	6a 01                	push   $0x1
     ef6:	50                   	push   %eax
     ef7:	56                   	push   %esi
     ef8:	e8 75 f7 ff ff       	call   672 <write>
        while(*s != 0){
     efd:	0f b6 03             	movzbl (%ebx),%eax
     f00:	83 c4 10             	add    $0x10,%esp
     f03:	84 c0                	test   %al,%al
     f05:	75 e1                	jne    ee8 <printf+0x228>
     f07:	8b 5d d0             	mov    -0x30(%ebp),%ebx
      state = 0;
     f0a:	31 c9                	xor    %ecx,%ecx
     f0c:	e9 09 fe ff ff       	jmp    d1a <printf+0x5a>
          s = "(null)";
     f11:	be d1 10 00 00       	mov    $0x10d1,%esi
        while(*s != 0){
     f16:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     f19:	b8 28 00 00 00       	mov    $0x28,%eax
     f1e:	89 f3                	mov    %esi,%ebx
     f20:	8b 75 08             	mov    0x8(%ebp),%esi
     f23:	eb c3                	jmp    ee8 <printf+0x228>
     f25:	66 90                	xchg   %ax,%ax
     f27:	66 90                	xchg   %ax,%ax
     f29:	66 90                	xchg   %ax,%ax
     f2b:	66 90                	xchg   %ax,%ax
     f2d:	66 90                	xchg   %ax,%ax
     f2f:	90                   	nop

00000f30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f30:	f3 0f 1e fb          	endbr32 
     f34:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f35:	a1 00 15 00 00       	mov    0x1500,%eax
{
     f3a:	89 e5                	mov    %esp,%ebp
     f3c:	57                   	push   %edi
     f3d:	56                   	push   %esi
     f3e:	53                   	push   %ebx
     f3f:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f42:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
     f44:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f47:	39 c8                	cmp    %ecx,%eax
     f49:	73 15                	jae    f60 <free+0x30>
     f4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f4f:	90                   	nop
     f50:	39 d1                	cmp    %edx,%ecx
     f52:	72 14                	jb     f68 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f54:	39 d0                	cmp    %edx,%eax
     f56:	73 10                	jae    f68 <free+0x38>
{
     f58:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f5a:	8b 10                	mov    (%eax),%edx
     f5c:	39 c8                	cmp    %ecx,%eax
     f5e:	72 f0                	jb     f50 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f60:	39 d0                	cmp    %edx,%eax
     f62:	72 f4                	jb     f58 <free+0x28>
     f64:	39 d1                	cmp    %edx,%ecx
     f66:	73 f0                	jae    f58 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
     f68:	8b 73 fc             	mov    -0x4(%ebx),%esi
     f6b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     f6e:	39 fa                	cmp    %edi,%edx
     f70:	74 1e                	je     f90 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     f72:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     f75:	8b 50 04             	mov    0x4(%eax),%edx
     f78:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     f7b:	39 f1                	cmp    %esi,%ecx
     f7d:	74 28                	je     fa7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     f7f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
     f81:	5b                   	pop    %ebx
  freep = p;
     f82:	a3 00 15 00 00       	mov    %eax,0x1500
}
     f87:	5e                   	pop    %esi
     f88:	5f                   	pop    %edi
     f89:	5d                   	pop    %ebp
     f8a:	c3                   	ret    
     f8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f8f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
     f90:	03 72 04             	add    0x4(%edx),%esi
     f93:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     f96:	8b 10                	mov    (%eax),%edx
     f98:	8b 12                	mov    (%edx),%edx
     f9a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     f9d:	8b 50 04             	mov    0x4(%eax),%edx
     fa0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     fa3:	39 f1                	cmp    %esi,%ecx
     fa5:	75 d8                	jne    f7f <free+0x4f>
    p->s.size += bp->s.size;
     fa7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
     faa:	a3 00 15 00 00       	mov    %eax,0x1500
    p->s.size += bp->s.size;
     faf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     fb2:	8b 53 f8             	mov    -0x8(%ebx),%edx
     fb5:	89 10                	mov    %edx,(%eax)
}
     fb7:	5b                   	pop    %ebx
     fb8:	5e                   	pop    %esi
     fb9:	5f                   	pop    %edi
     fba:	5d                   	pop    %ebp
     fbb:	c3                   	ret    
     fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000fc0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     fc0:	f3 0f 1e fb          	endbr32 
     fc4:	55                   	push   %ebp
     fc5:	89 e5                	mov    %esp,%ebp
     fc7:	57                   	push   %edi
     fc8:	56                   	push   %esi
     fc9:	53                   	push   %ebx
     fca:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fcd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     fd0:	8b 3d 00 15 00 00    	mov    0x1500,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fd6:	8d 70 07             	lea    0x7(%eax),%esi
     fd9:	c1 ee 03             	shr    $0x3,%esi
     fdc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
     fdf:	85 ff                	test   %edi,%edi
     fe1:	0f 84 a9 00 00 00    	je     1090 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fe7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
     fe9:	8b 48 04             	mov    0x4(%eax),%ecx
     fec:	39 f1                	cmp    %esi,%ecx
     fee:	73 6d                	jae    105d <malloc+0x9d>
     ff0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
     ff6:	bb 00 10 00 00       	mov    $0x1000,%ebx
     ffb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
     ffe:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1005:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1008:	eb 17                	jmp    1021 <malloc+0x61>
    100a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1010:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1012:	8b 4a 04             	mov    0x4(%edx),%ecx
    1015:	39 f1                	cmp    %esi,%ecx
    1017:	73 4f                	jae    1068 <malloc+0xa8>
    1019:	8b 3d 00 15 00 00    	mov    0x1500,%edi
    101f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1021:	39 c7                	cmp    %eax,%edi
    1023:	75 eb                	jne    1010 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1025:	83 ec 0c             	sub    $0xc,%esp
    1028:	ff 75 e4             	pushl  -0x1c(%ebp)
    102b:	e8 64 f8 ff ff       	call   894 <sbrk>
  if(p == (char*)-1)
    1030:	83 c4 10             	add    $0x10,%esp
    1033:	83 f8 ff             	cmp    $0xffffffff,%eax
    1036:	74 1b                	je     1053 <malloc+0x93>
  hp->s.size = nu;
    1038:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	83 c0 08             	add    $0x8,%eax
    1041:	50                   	push   %eax
    1042:	e8 e9 fe ff ff       	call   f30 <free>
  return freep;
    1047:	a1 00 15 00 00       	mov    0x1500,%eax
      if((p = morecore(nunits)) == 0)
    104c:	83 c4 10             	add    $0x10,%esp
    104f:	85 c0                	test   %eax,%eax
    1051:	75 bd                	jne    1010 <malloc+0x50>
        return 0;
  }
}
    1053:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1056:	31 c0                	xor    %eax,%eax
}
    1058:	5b                   	pop    %ebx
    1059:	5e                   	pop    %esi
    105a:	5f                   	pop    %edi
    105b:	5d                   	pop    %ebp
    105c:	c3                   	ret    
    if(p->s.size >= nunits){
    105d:	89 c2                	mov    %eax,%edx
    105f:	89 f8                	mov    %edi,%eax
    1061:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1068:	39 ce                	cmp    %ecx,%esi
    106a:	74 54                	je     10c0 <malloc+0x100>
        p->s.size -= nunits;
    106c:	29 f1                	sub    %esi,%ecx
    106e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1071:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1074:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1077:	a3 00 15 00 00       	mov    %eax,0x1500
}
    107c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    107f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1082:	5b                   	pop    %ebx
    1083:	5e                   	pop    %esi
    1084:	5f                   	pop    %edi
    1085:	5d                   	pop    %ebp
    1086:	c3                   	ret    
    1087:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1090:	c7 05 00 15 00 00 04 	movl   $0x1504,0x1500
    1097:	15 00 00 
    base.s.size = 0;
    109a:	bf 04 15 00 00       	mov    $0x1504,%edi
    base.s.ptr = freep = prevp = &base;
    109f:	c7 05 04 15 00 00 04 	movl   $0x1504,0x1504
    10a6:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10a9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    10ab:	c7 05 08 15 00 00 00 	movl   $0x0,0x1508
    10b2:	00 00 00 
    if(p->s.size >= nunits){
    10b5:	e9 36 ff ff ff       	jmp    ff0 <malloc+0x30>
    10ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    10c0:	8b 0a                	mov    (%edx),%ecx
    10c2:	89 08                	mov    %ecx,(%eax)
    10c4:	eb b1                	jmp    1077 <malloc+0xb7>
