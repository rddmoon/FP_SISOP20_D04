
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
       0:	f3 0f 1e fb          	endbr32 
       4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       8:	83 e4 f0             	and    $0xfffffff0,%esp
       b:	ff 71 fc             	pushl  -0x4(%ecx)
       e:	55                   	push   %ebp
       f:	89 e5                	mov    %esp,%ebp
      11:	57                   	push   %edi
      12:	56                   	push   %esi
      13:	be 01 00 00 00       	mov    $0x1,%esi
      18:	53                   	push   %ebx
      19:	51                   	push   %ecx
      1a:	83 ec 18             	sub    $0x18,%esp
      1d:	8b 01                	mov    (%ecx),%eax
      1f:	8b 59 04             	mov    0x4(%ecx),%ebx
      22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
      28:	83 f8 01             	cmp    $0x1,%eax
      2b:	7e 50                	jle    7d <main+0x7d>
      2d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      30:	83 ec 08             	sub    $0x8,%esp
      33:	6a 00                	push   $0x0
      35:	ff 33                	pushl  (%ebx)
      37:	e8 42 07 00 00       	call   77e <open>
      3c:	83 c4 10             	add    $0x10,%esp
      3f:	89 c7                	mov    %eax,%edi
      41:	85 c0                	test   %eax,%eax
      43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
      45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
      48:	83 c6 01             	add    $0x1,%esi
      4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
      4e:	50                   	push   %eax
      4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
      54:	89 3c 24             	mov    %edi,(%esp)
      57:	e8 ad 06 00 00       	call   709 <close>
  for(i = 1; i < argc; i++){
      5c:	83 c4 10             	add    $0x10,%esp
      5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
      62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
      64:	e8 a7 05 00 00       	call   610 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
      69:	50                   	push   %eax
      6a:	ff 33                	pushl  (%ebx)
      6c:	68 49 11 00 00       	push   $0x1149
      71:	6a 01                	push   $0x1
      73:	e8 b8 0c 00 00       	call   d30 <printf>
      exit();
      78:	e8 93 05 00 00       	call   610 <exit>
    cat(0);
      7d:	83 ec 0c             	sub    $0xc,%esp
      80:	6a 00                	push   $0x0
      82:	e8 09 00 00 00       	call   90 <cat>
    exit();
      87:	e8 84 05 00 00       	call   610 <exit>
      8c:	66 90                	xchg   %ax,%ax
      8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
      90:	f3 0f 1e fb          	endbr32 
      94:	55                   	push   %ebp
      95:	89 e5                	mov    %esp,%ebp
      97:	53                   	push   %ebx
      98:	83 ec 04             	sub    $0x4,%esp
      9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while((n = read(fd, buf, sizeof(buf))) > 0)
      9e:	eb 13                	jmp    b3 <cat+0x23>
    write(1, buf, n);
      a0:	83 ec 04             	sub    $0x4,%esp
      a3:	50                   	push   %eax
      a4:	68 00 16 00 00       	push   $0x1600
      a9:	6a 01                	push   $0x1
      ab:	e8 32 06 00 00       	call   6e2 <write>
      b0:	83 c4 10             	add    $0x10,%esp
  while((n = read(fd, buf, sizeof(buf))) > 0)
      b3:	83 ec 04             	sub    $0x4,%esp
      b6:	68 00 02 00 00       	push   $0x200
      bb:	68 00 16 00 00       	push   $0x1600
      c0:	53                   	push   %ebx
      c1:	e8 f5 05 00 00       	call   6bb <read>
      c6:	83 c4 10             	add    $0x10,%esp
      c9:	85 c0                	test   %eax,%eax
      cb:	7f d3                	jg     a0 <cat+0x10>
  if(n < 0){
      cd:	75 05                	jne    d4 <cat+0x44>
}
      cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      d2:	c9                   	leave  
      d3:	c3                   	ret    
    printf(1, "cat: read error\n");
      d4:	50                   	push   %eax
      d5:	50                   	push   %eax
      d6:	68 38 11 00 00       	push   $0x1138
      db:	6a 01                	push   $0x1
      dd:	e8 4e 0c 00 00       	call   d30 <printf>
    exit();
      e2:	e8 29 05 00 00       	call   610 <exit>
      e7:	66 90                	xchg   %ax,%ax
      e9:	66 90                	xchg   %ax,%ax
      eb:	66 90                	xchg   %ax,%ax
      ed:	66 90                	xchg   %ax,%ax
      ef:	90                   	nop

000000f0 <strcpy>:

char **environ = 0;

char*
strcpy(char *s, char *t)
{
      f0:	f3 0f 1e fb          	endbr32 
      f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
      f5:	31 c0                	xor    %eax,%eax
{
      f7:	89 e5                	mov    %esp,%ebp
      f9:	53                   	push   %ebx
      fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
      fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
     100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     107:	83 c0 01             	add    $0x1,%eax
     10a:	84 d2                	test   %dl,%dl
     10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
     10e:	89 c8                	mov    %ecx,%eax
     110:	5b                   	pop    %ebx
     111:	5d                   	pop    %ebp
     112:	c3                   	ret    
     113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     120:	f3 0f 1e fb          	endbr32 
     124:	55                   	push   %ebp
     125:	89 e5                	mov    %esp,%ebp
     127:	53                   	push   %ebx
     128:	8b 4d 08             	mov    0x8(%ebp),%ecx
     12b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     12e:	0f b6 01             	movzbl (%ecx),%eax
     131:	0f b6 1a             	movzbl (%edx),%ebx
     134:	84 c0                	test   %al,%al
     136:	75 19                	jne    151 <strcmp+0x31>
     138:	eb 26                	jmp    160 <strcmp+0x40>
     13a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     144:	83 c1 01             	add    $0x1,%ecx
     147:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     14a:	0f b6 1a             	movzbl (%edx),%ebx
     14d:	84 c0                	test   %al,%al
     14f:	74 0f                	je     160 <strcmp+0x40>
     151:	38 d8                	cmp    %bl,%al
     153:	74 eb                	je     140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     155:	29 d8                	sub    %ebx,%eax
}
     157:	5b                   	pop    %ebx
     158:	5d                   	pop    %ebp
     159:	c3                   	ret    
     15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     162:	29 d8                	sub    %ebx,%eax
}
     164:	5b                   	pop    %ebx
     165:	5d                   	pop    %ebp
     166:	c3                   	ret    
     167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     16e:	66 90                	xchg   %ax,%ax

00000170 <strlen>:

uint
strlen(const char *s)
{
     170:	f3 0f 1e fb          	endbr32 
     174:	55                   	push   %ebp
     175:	89 e5                	mov    %esp,%ebp
     177:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     17a:	80 3a 00             	cmpb   $0x0,(%edx)
     17d:	74 21                	je     1a0 <strlen+0x30>
     17f:	31 c0                	xor    %eax,%eax
     181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     188:	83 c0 01             	add    $0x1,%eax
     18b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     18f:	89 c1                	mov    %eax,%ecx
     191:	75 f5                	jne    188 <strlen+0x18>
    ;
  return n;
}
     193:	89 c8                	mov    %ecx,%eax
     195:	5d                   	pop    %ebp
     196:	c3                   	ret    
     197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     19e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
     1a0:	31 c9                	xor    %ecx,%ecx
}
     1a2:	5d                   	pop    %ebp
     1a3:	89 c8                	mov    %ecx,%eax
     1a5:	c3                   	ret    
     1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <safestrcpy>:

char*
safestrcpy(char *s, const char *t, int n)
{
     1b0:	f3 0f 1e fb          	endbr32 
     1b4:	55                   	push   %ebp
     1b5:	89 e5                	mov    %esp,%ebp
     1b7:	56                   	push   %esi
     1b8:	8b 55 10             	mov    0x10(%ebp),%edx
     1bb:	8b 75 08             	mov    0x8(%ebp),%esi
     1be:	53                   	push   %ebx
     1bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *os;
  
  os = s;
  if(n <= 0)
     1c2:	85 d2                	test   %edx,%edx
     1c4:	7e 21                	jle    1e7 <safestrcpy+0x37>
     1c6:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
     1ca:	89 f2                	mov    %esi,%edx
     1cc:	eb 12                	jmp    1e0 <safestrcpy+0x30>
     1ce:	66 90                	xchg   %ax,%ax
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
     1d0:	0f b6 08             	movzbl (%eax),%ecx
     1d3:	83 c0 01             	add    $0x1,%eax
     1d6:	83 c2 01             	add    $0x1,%edx
     1d9:	88 4a ff             	mov    %cl,-0x1(%edx)
     1dc:	84 c9                	test   %cl,%cl
     1de:	74 04                	je     1e4 <safestrcpy+0x34>
     1e0:	39 d8                	cmp    %ebx,%eax
     1e2:	75 ec                	jne    1d0 <safestrcpy+0x20>
    ;
  *s = 0;
     1e4:	c6 02 00             	movb   $0x0,(%edx)
  return os;
}
     1e7:	89 f0                	mov    %esi,%eax
     1e9:	5b                   	pop    %ebx
     1ea:	5e                   	pop    %esi
     1eb:	5d                   	pop    %ebp
     1ec:	c3                   	ret    
     1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1f0:	f3 0f 1e fb          	endbr32 
     1f4:	55                   	push   %ebp
     1f5:	89 e5                	mov    %esp,%ebp
     1f7:	57                   	push   %edi
     1f8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     1fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
     1fe:	8b 45 0c             	mov    0xc(%ebp),%eax
     201:	89 d7                	mov    %edx,%edi
     203:	fc                   	cld    
     204:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     206:	89 d0                	mov    %edx,%eax
     208:	5f                   	pop    %edi
     209:	5d                   	pop    %ebp
     20a:	c3                   	ret    
     20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     20f:	90                   	nop

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
     210:	f3 0f 1e fb          	endbr32 
     214:	55                   	push   %ebp
     215:	89 e5                	mov    %esp,%ebp
     217:	8b 45 08             	mov    0x8(%ebp),%eax
     21a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     21e:	0f b6 10             	movzbl (%eax),%edx
     221:	84 d2                	test   %dl,%dl
     223:	75 16                	jne    23b <strchr+0x2b>
     225:	eb 21                	jmp    248 <strchr+0x38>
     227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     22e:	66 90                	xchg   %ax,%ax
     230:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     234:	83 c0 01             	add    $0x1,%eax
     237:	84 d2                	test   %dl,%dl
     239:	74 0d                	je     248 <strchr+0x38>
    if(*s == c)
     23b:	38 d1                	cmp    %dl,%cl
     23d:	75 f1                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
}
     23f:	5d                   	pop    %ebp
     240:	c3                   	ret    
     241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     248:	31 c0                	xor    %eax,%eax
}
     24a:	5d                   	pop    %ebp
     24b:	c3                   	ret    
     24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <fgets>:
  return fgets(buf, max, 0);
}

char*
fgets(char* buf, int size, int fd)
{
     250:	f3 0f 1e fb          	endbr32 
     254:	55                   	push   %ebp
     255:	89 e5                	mov    %esp,%ebp
     257:	57                   	push   %edi
  int i;
  char c;

  for(i = 0; i + 1 < size;){
     258:	31 ff                	xor    %edi,%edi
{
     25a:	56                   	push   %esi
     25b:	53                   	push   %ebx
     25c:	89 fb                	mov    %edi,%ebx
     25e:	83 ec 1c             	sub    $0x1c,%esp
     261:	8b 75 08             	mov    0x8(%ebp),%esi
     264:	89 f7                	mov    %esi,%edi
  for(i = 0; i + 1 < size;){
     266:	eb 32                	jmp    29a <fgets+0x4a>
     268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     26f:	90                   	nop
    int cc = read(fd, &c, 1);
     270:	83 ec 04             	sub    $0x4,%esp
     273:	8d 45 e7             	lea    -0x19(%ebp),%eax
     276:	6a 01                	push   $0x1
     278:	50                   	push   %eax
     279:	ff 75 10             	pushl  0x10(%ebp)
     27c:	e8 3a 04 00 00       	call   6bb <read>
    if(cc < 1)
     281:	83 c4 10             	add    $0x10,%esp
     284:	85 c0                	test   %eax,%eax
     286:	7e 1c                	jle    2a4 <fgets+0x54>
      break;
    buf[i++] = c;
     288:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     28c:	83 c7 01             	add    $0x1,%edi
     28f:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
     292:	3c 0a                	cmp    $0xa,%al
     294:	74 22                	je     2b8 <fgets+0x68>
     296:	3c 0d                	cmp    $0xd,%al
     298:	74 1e                	je     2b8 <fgets+0x68>
  for(i = 0; i + 1 < size;){
     29a:	83 c3 01             	add    $0x1,%ebx
     29d:	89 fe                	mov    %edi,%esi
     29f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     2a2:	7c cc                	jl     270 <fgets+0x20>
     2a4:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
     2a6:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
     2a9:	c6 03 00             	movb   $0x0,(%ebx)
}
     2ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2af:	5b                   	pop    %ebx
     2b0:	5e                   	pop    %esi
     2b1:	5f                   	pop    %edi
     2b2:	5d                   	pop    %ebp
     2b3:	c3                   	ret    
     2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     2b8:	89 df                	mov    %ebx,%edi
     2ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
     2bd:	8b 45 08             	mov    0x8(%ebp),%eax
     2c0:	01 fb                	add    %edi,%ebx
  buf[i] = '\0';
     2c2:	c6 03 00             	movb   $0x0,(%ebx)
}
     2c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2c8:	5b                   	pop    %ebx
     2c9:	5e                   	pop    %esi
     2ca:	5f                   	pop    %edi
     2cb:	5d                   	pop    %ebp
     2cc:	c3                   	ret    
     2cd:	8d 76 00             	lea    0x0(%esi),%esi

000002d0 <gets>:
{
     2d0:	f3 0f 1e fb          	endbr32 
     2d4:	55                   	push   %ebp
     2d5:	89 e5                	mov    %esp,%ebp
     2d7:	83 ec 0c             	sub    $0xc,%esp
  return fgets(buf, max, 0);
     2da:	6a 00                	push   $0x0
     2dc:	ff 75 0c             	pushl  0xc(%ebp)
     2df:	ff 75 08             	pushl  0x8(%ebp)
     2e2:	e8 69 ff ff ff       	call   250 <fgets>
}
     2e7:	c9                   	leave  
     2e8:	c3                   	ret    
     2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <stat>:

int
stat(char *n, struct stat *st)
{
     2f0:	f3 0f 1e fb          	endbr32 
     2f4:	55                   	push   %ebp
     2f5:	89 e5                	mov    %esp,%ebp
     2f7:	56                   	push   %esi
     2f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY | O_NONBLOCK);
     2f9:	83 ec 08             	sub    $0x8,%esp
     2fc:	68 00 08 00 00       	push   $0x800
     301:	ff 75 08             	pushl  0x8(%ebp)
     304:	e8 75 04 00 00       	call   77e <open>
  if(fd < 0)
     309:	83 c4 10             	add    $0x10,%esp
     30c:	85 c0                	test   %eax,%eax
     30e:	78 28                	js     338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     310:	83 ec 08             	sub    $0x8,%esp
     313:	ff 75 0c             	pushl  0xc(%ebp)
     316:	89 c3                	mov    %eax,%ebx
     318:	50                   	push   %eax
     319:	e8 fc 04 00 00       	call   81a <fstat>
  close(fd);
     31e:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     321:	89 c6                	mov    %eax,%esi
  close(fd);
     323:	e8 e1 03 00 00       	call   709 <close>
  return r;
     328:	83 c4 10             	add    $0x10,%esp
}
     32b:	8d 65 f8             	lea    -0x8(%ebp),%esp
     32e:	89 f0                	mov    %esi,%eax
     330:	5b                   	pop    %ebx
     331:	5e                   	pop    %esi
     332:	5d                   	pop    %ebp
     333:	c3                   	ret    
     334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     338:	be ff ff ff ff       	mov    $0xffffffff,%esi
     33d:	eb ec                	jmp    32b <stat+0x3b>
     33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
     340:	f3 0f 1e fb          	endbr32 
     344:	55                   	push   %ebp
     345:	89 e5                	mov    %esp,%ebp
     347:	53                   	push   %ebx
     348:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     34b:	0f be 02             	movsbl (%edx),%eax
     34e:	8d 48 d0             	lea    -0x30(%eax),%ecx
     351:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     354:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     359:	77 1a                	ja     375 <atoi+0x35>
     35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     35f:	90                   	nop
    n = n*10 + *s++ - '0';
     360:	83 c2 01             	add    $0x1,%edx
     363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     36a:	0f be 02             	movsbl (%edx),%eax
     36d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     370:	80 fb 09             	cmp    $0x9,%bl
     373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
     375:	89 c8                	mov    %ecx,%eax
     377:	5b                   	pop    %ebx
     378:	5d                   	pop    %ebp
     379:	c3                   	ret    
     37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     380:	f3 0f 1e fb          	endbr32 
     384:	55                   	push   %ebp
     385:	89 e5                	mov    %esp,%ebp
     387:	57                   	push   %edi
     388:	8b 45 10             	mov    0x10(%ebp),%eax
     38b:	8b 55 08             	mov    0x8(%ebp),%edx
     38e:	56                   	push   %esi
     38f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     392:	85 c0                	test   %eax,%eax
     394:	7e 0f                	jle    3a5 <memmove+0x25>
     396:	01 d0                	add    %edx,%eax
  dst = vdst;
     398:	89 d7                	mov    %edx,%edi
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
     3a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     3a1:	39 f8                	cmp    %edi,%eax
     3a3:	75 fb                	jne    3a0 <memmove+0x20>
  return vdst;
}
     3a5:	5e                   	pop    %esi
     3a6:	89 d0                	mov    %edx,%eax
     3a8:	5f                   	pop    %edi
     3a9:	5d                   	pop    %ebp
     3aa:	c3                   	ret    
     3ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     3af:	90                   	nop

000003b0 <strncmp>:

int
strncmp(const char* p, const char* q, uint n)
{
     3b0:	f3 0f 1e fb          	endbr32 
     3b4:	55                   	push   %ebp
     3b5:	89 e5                	mov    %esp,%ebp
     3b7:	56                   	push   %esi
     3b8:	8b 75 10             	mov    0x10(%ebp),%esi
     3bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
     3be:	53                   	push   %ebx
     3bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  while(n > 0 && *p && (*p == *q))
     3c2:	85 f6                	test   %esi,%esi
     3c4:	74 32                	je     3f8 <strncmp+0x48>
     3c6:	01 c6                	add    %eax,%esi
     3c8:	eb 14                	jmp    3de <strncmp+0x2e>
     3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     3d0:	38 da                	cmp    %bl,%dl
     3d2:	75 14                	jne    3e8 <strncmp+0x38>
    n--, p++, q++;
     3d4:	83 c0 01             	add    $0x1,%eax
     3d7:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && (*p == *q))
     3da:	39 c6                	cmp    %eax,%esi
     3dc:	74 1a                	je     3f8 <strncmp+0x48>
     3de:	0f b6 11             	movzbl (%ecx),%edx
     3e1:	0f be 18             	movsbl (%eax),%ebx
     3e4:	84 d2                	test   %dl,%dl
     3e6:	75 e8                	jne    3d0 <strncmp+0x20>
  if(n == 0)
    return 0;
  return (int)*p - (int)*q;
     3e8:	0f be c2             	movsbl %dl,%eax
     3eb:	29 d8                	sub    %ebx,%eax
}
     3ed:	5b                   	pop    %ebx
     3ee:	5e                   	pop    %esi
     3ef:	5d                   	pop    %ebp
     3f0:	c3                   	ret    
     3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3f8:	5b                   	pop    %ebx
    return 0;
     3f9:	31 c0                	xor    %eax,%eax
}
     3fb:	5e                   	pop    %esi
     3fc:	5d                   	pop    %ebp
     3fd:	c3                   	ret    
     3fe:	66 90                	xchg   %ax,%ax

00000400 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
     400:	f3 0f 1e fb          	endbr32 
     404:	55                   	push   %ebp
     405:	89 e5                	mov    %esp,%ebp
     407:	57                   	push   %edi
     408:	56                   	push   %esi
     409:	8b 75 08             	mov    0x8(%ebp),%esi
     40c:	53                   	push   %ebx
     40d:	8b 45 10             	mov    0x10(%ebp),%eax
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
     410:	89 f2                	mov    %esi,%edx
     412:	eb 1b                	jmp    42f <strncpy+0x2f>
     414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     418:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
     41c:	8b 7d 0c             	mov    0xc(%ebp),%edi
     41f:	83 c2 01             	add    $0x1,%edx
     422:	0f b6 7f ff          	movzbl -0x1(%edi),%edi
     426:	89 f9                	mov    %edi,%ecx
     428:	88 4a ff             	mov    %cl,-0x1(%edx)
     42b:	84 c9                	test   %cl,%cl
     42d:	74 09                	je     438 <strncpy+0x38>
     42f:	89 c3                	mov    %eax,%ebx
     431:	83 e8 01             	sub    $0x1,%eax
     434:	85 db                	test   %ebx,%ebx
     436:	7f e0                	jg     418 <strncpy+0x18>
    ;
  while(n-- > 0)
     438:	89 d1                	mov    %edx,%ecx
     43a:	85 c0                	test   %eax,%eax
     43c:	7e 15                	jle    453 <strncpy+0x53>
     43e:	66 90                	xchg   %ax,%ax
    *s++ = 0;
     440:	83 c1 01             	add    $0x1,%ecx
     443:	c6 41 ff 00          	movb   $0x0,-0x1(%ecx)
  while(n-- > 0)
     447:	89 c8                	mov    %ecx,%eax
     449:	f7 d0                	not    %eax
     44b:	01 d0                	add    %edx,%eax
     44d:	01 d8                	add    %ebx,%eax
     44f:	85 c0                	test   %eax,%eax
     451:	7f ed                	jg     440 <strncpy+0x40>
  return os;
}
     453:	5b                   	pop    %ebx
     454:	89 f0                	mov    %esi,%eax
     456:	5e                   	pop    %esi
     457:	5f                   	pop    %edi
     458:	5d                   	pop    %ebp
     459:	c3                   	ret    
     45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000460 <strrchr>:

char*
strrchr(const char *s, int c)
{
     460:	f3 0f 1e fb          	endbr32 
     464:	55                   	push   %ebp
  char *p = (char*)s;
  char *result = 0;
     465:	31 c9                	xor    %ecx,%ecx
{
     467:	89 e5                	mov    %esp,%ebp
     469:	53                   	push   %ebx
     46a:	8b 55 08             	mov    0x8(%ebp),%edx
     46d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while (*p) {
     470:	0f be 02             	movsbl (%edx),%eax
     473:	84 c0                	test   %al,%al
     475:	74 19                	je     490 <strrchr+0x30>
     477:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     47e:	66 90                	xchg   %ax,%ax
    if (*p == c) {
     480:	39 d8                	cmp    %ebx,%eax
     482:	0f 44 ca             	cmove  %edx,%ecx
  while (*p) {
     485:	0f be 42 01          	movsbl 0x1(%edx),%eax
      result = p;
    }
    p++;
     489:	83 c2 01             	add    $0x1,%edx
  while (*p) {
     48c:	84 c0                	test   %al,%al
     48e:	75 f0                	jne    480 <strrchr+0x20>
  }
  if (*p == c) return p;
     490:	85 db                	test   %ebx,%ebx
  return result;
}
     492:	5b                   	pop    %ebx
     493:	5d                   	pop    %ebp
  if (*p == c) return p;
     494:	0f 44 ca             	cmove  %edx,%ecx
}
     497:	89 c8                	mov    %ecx,%eax
     499:	c3                   	ret    
     49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <strchrnul>:

char*
strchrnul(const char* s, int c)
{
     4a0:	f3 0f 1e fb          	endbr32 
     4a4:	55                   	push   %ebp
     4a5:	89 e5                	mov    %esp,%ebp
     4a7:	8b 55 08             	mov    0x8(%ebp),%edx
     4aa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *p = (char*)s;
  while (*p && *p != c) {
     4ad:	0f be 02             	movsbl (%edx),%eax
     4b0:	84 c0                	test   %al,%al
     4b2:	75 17                	jne    4cb <strchrnul+0x2b>
     4b4:	eb 19                	jmp    4cf <strchrnul+0x2f>
     4b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4bd:	8d 76 00             	lea    0x0(%esi),%esi
     4c0:	0f be 42 01          	movsbl 0x1(%edx),%eax
    p++;
     4c4:	83 c2 01             	add    $0x1,%edx
  while (*p && *p != c) {
     4c7:	84 c0                	test   %al,%al
     4c9:	74 04                	je     4cf <strchrnul+0x2f>
     4cb:	39 c8                	cmp    %ecx,%eax
     4cd:	75 f1                	jne    4c0 <strchrnul+0x20>
  }
  return p;
}
     4cf:	89 d0                	mov    %edx,%eax
     4d1:	5d                   	pop    %ebp
     4d2:	c3                   	ret    
     4d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     4da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004e0 <getenv>:

char*
getenv(const char *name)
{
     4e0:	f3 0f 1e fb          	endbr32 
     4e4:	55                   	push   %ebp
     4e5:	89 e5                	mov    %esp,%ebp
     4e7:	57                   	push   %edi
     4e8:	56                   	push   %esi
     4e9:	53                   	push   %ebx
     4ea:	83 ec 0c             	sub    $0xc,%esp
  for(n = 0; s[n]; n++)
     4ed:	8b 45 08             	mov    0x8(%ebp),%eax
     4f0:	0f b6 00             	movzbl (%eax),%eax
     4f3:	88 45 eb             	mov    %al,-0x15(%ebp)
     4f6:	84 c0                	test   %al,%al
     4f8:	0f 84 95 00 00 00    	je     593 <getenv+0xb3>
     4fe:	8b 55 08             	mov    0x8(%ebp),%edx
     501:	31 c0                	xor    %eax,%eax
     503:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     507:	90                   	nop
     508:	83 c0 01             	add    $0x1,%eax
     50b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     50f:	75 f7                	jne    508 <getenv+0x28>
     511:	89 45 ec             	mov    %eax,-0x14(%ebp)
  int length = strlen(name);
  for (int i = 0; environ[i]; ++i) {
     514:	a1 c0 15 00 00       	mov    0x15c0,%eax
     519:	8b 38                	mov    (%eax),%edi
     51b:	85 ff                	test   %edi,%edi
     51d:	74 5c                	je     57b <getenv+0x9b>
     51f:	83 c0 04             	add    $0x4,%eax
     522:	8b 75 ec             	mov    -0x14(%ebp),%esi
     525:	03 75 08             	add    0x8(%ebp),%esi
     528:	89 45 f0             	mov    %eax,-0x10(%ebp)
     52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     52f:	90                   	nop
  while(n > 0 && *p && (*p == *q))
     530:	8b 45 ec             	mov    -0x14(%ebp),%eax
     533:	85 c0                	test   %eax,%eax
     535:	74 2d                	je     564 <getenv+0x84>
     537:	8b 45 08             	mov    0x8(%ebp),%eax
  for(n = 0; s[n]; n++)
     53a:	0f b6 5d eb          	movzbl -0x15(%ebp),%ebx
  while(n > 0 && *p && (*p == *q))
     53e:	89 f9                	mov    %edi,%ecx
     540:	83 c0 01             	add    $0x1,%eax
     543:	eb 14                	jmp    559 <getenv+0x79>
     545:	8d 76 00             	lea    0x0(%esi),%esi
     548:	38 d3                	cmp    %dl,%bl
     54a:	75 21                	jne    56d <getenv+0x8d>
    n--, p++, q++;
     54c:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && (*p == *q))
     54f:	39 f0                	cmp    %esi,%eax
     551:	74 11                	je     564 <getenv+0x84>
     553:	0f b6 18             	movzbl (%eax),%ebx
     556:	83 c0 01             	add    $0x1,%eax
     559:	0f b6 11             	movzbl (%ecx),%edx
     55c:	84 d2                	test   %dl,%dl
     55e:	75 e8                	jne    548 <getenv+0x68>
    if (strncmp(environ[i], name, length) == 0 &&
     560:	84 db                	test   %bl,%bl
     562:	75 09                	jne    56d <getenv+0x8d>
     564:	8b 45 ec             	mov    -0x14(%ebp),%eax
     567:	80 3c 07 3d          	cmpb   $0x3d,(%edi,%eax,1)
     56b:	74 18                	je     585 <getenv+0xa5>
  for (int i = 0; environ[i]; ++i) {
     56d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
     571:	8b 45 f0             	mov    -0x10(%ebp),%eax
     574:	8b 78 fc             	mov    -0x4(%eax),%edi
     577:	85 ff                	test   %edi,%edi
     579:	75 b5                	jne    530 <getenv+0x50>
        environ[i][length] == '=') {
      return environ[i] + length + 1;
    }
  }
  return 0;
}
     57b:	83 c4 0c             	add    $0xc,%esp
     57e:	89 f8                	mov    %edi,%eax
     580:	5b                   	pop    %ebx
     581:	5e                   	pop    %esi
     582:	5f                   	pop    %edi
     583:	5d                   	pop    %ebp
     584:	c3                   	ret    
     585:	83 c4 0c             	add    $0xc,%esp
      return environ[i] + length + 1;
     588:	8d 7c 07 01          	lea    0x1(%edi,%eax,1),%edi
}
     58c:	5b                   	pop    %ebx
     58d:	89 f8                	mov    %edi,%eax
     58f:	5e                   	pop    %esi
     590:	5f                   	pop    %edi
     591:	5d                   	pop    %ebp
     592:	c3                   	ret    
  for(n = 0; s[n]; n++)
     593:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     59a:	e9 75 ff ff ff       	jmp    514 <getenv+0x34>
     59f:	90                   	nop

000005a0 <clone_fn>:

#define STACKSIZE 4096

int
clone_fn(int (*fn)(void*), void* stack, void* arg)
{
     5a0:	f3 0f 1e fb          	endbr32 
     5a4:	55                   	push   %ebp
     5a5:	89 e5                	mov    %esp,%ebp
     5a7:	53                   	push   %ebx
     5a8:	83 ec 04             	sub    $0x4,%esp
     5ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int retval;
  if (stack == 0)
     5ae:	85 db                	test   %ebx,%ebx
     5b0:	74 36                	je     5e8 <f1+0xf>
  {
    stack = (void*)malloc(STACKSIZE);
    stack = (void*)(stack + STACKSIZE);
  }
  stack = (void*)(((void**)stack) - 1);
  *(void**)stack = arg;
     5b2:	8b 45 10             	mov    0x10(%ebp),%eax
  __asm__ __volatile__(
     5b5:	8b 55 08             	mov    0x8(%ebp),%edx
  stack = (void*)(((void**)stack) - 1);
     5b8:	83 eb 04             	sub    $0x4,%ebx
  __asm__ __volatile__(
     5bb:	b9 00 07 01 00       	mov    $0x10700,%ecx
  *(void**)stack = arg;
     5c0:	89 03                	mov    %eax,(%ebx)
  __asm__ __volatile__(
     5c2:	b8 22 00 00 00       	mov    $0x22,%eax
     5c7:	51                   	push   %ecx
     5c8:	53                   	push   %ebx
     5c9:	50                   	push   %eax
     5ca:	cd 40                	int    $0x40
     5cc:	85 c0                	test   %eax,%eax
     5ce:	75 09                	jne    5d9 <f1>
     5d0:	ff d2                	call   *%edx
     5d2:	b8 02 00 00 00       	mov    $0x2,%eax
     5d7:	cd 40                	int    $0x40

000005d9 <f1>:
      :"=a" (retval)
      :"0" (SYS_clone),"i" (SYS__exit),
      "r" (fn),
      "b" (stack),
      "c" (CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_THREAD));
  if (retval < 0)
     5d9:	85 c0                	test   %eax,%eax
     5db:	78 23                	js     600 <f1+0x27>
  {
    errno = -retval;
    retval = -1;
  }
  return retval;
}
     5dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5e0:	c9                   	leave  
     5e1:	c3                   	ret    
     5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    stack = (void*)malloc(STACKSIZE);
     5e8:	83 ec 0c             	sub    $0xc,%esp
     5eb:	68 00 10 00 00       	push   $0x1000
     5f0:	e8 3b 0a 00 00       	call   1030 <malloc>
    stack = (void*)(stack + STACKSIZE);
     5f5:	83 c4 10             	add    $0x10,%esp
     5f8:	8d 98 00 10 00 00    	lea    0x1000(%eax),%ebx
     5fe:	eb b2                	jmp    5b2 <clone_fn+0x12>
    errno = -retval;
     600:	f7 d8                	neg    %eax
     602:	a3 e0 15 00 00       	mov    %eax,0x15e0
    retval = -1;
     607:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return retval;
     60c:	eb cf                	jmp    5dd <f1+0x4>
     60e:	66 90                	xchg   %ax,%ax

00000610 <exit>:

int
exit(void)
{
     610:	f3 0f 1e fb          	endbr32 
     614:	55                   	push   %ebp
     615:	89 e5                	mov    %esp,%ebp
     617:	83 ec 08             	sub    $0x8,%esp
  exit_group();
     61a:	e8 2e 05 00 00       	call   b4d <exit_group>

0000061f <fork>:
    subl %eax, errno; \
    movl $-1, %eax; \
  ok_ ## name : \
    ret

SYSCALL(fork)
     61f:	b8 01 00 00 00       	mov    $0x1,%eax
     624:	cd 40                	int    $0x40
     626:	83 f8 00             	cmp    $0x0,%eax
     629:	7d 1a                	jge    645 <ok_fork>
     62b:	83 f8 80             	cmp    $0xffffff80,%eax
     62e:	7c 15                	jl     645 <ok_fork>
     630:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     637:	00 00 00 
     63a:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     640:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000645 <ok_fork>:
     645:	c3                   	ret    

00000646 <_exit>:
SYSCALL(_exit)
     646:	b8 02 00 00 00       	mov    $0x2,%eax
     64b:	cd 40                	int    $0x40
     64d:	83 f8 00             	cmp    $0x0,%eax
     650:	7d 1a                	jge    66c <ok__exit>
     652:	83 f8 80             	cmp    $0xffffff80,%eax
     655:	7c 15                	jl     66c <ok__exit>
     657:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     65e:	00 00 00 
     661:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     667:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000066c <ok__exit>:
     66c:	c3                   	ret    

0000066d <wait>:
SYSCALL(wait)
     66d:	b8 03 00 00 00       	mov    $0x3,%eax
     672:	cd 40                	int    $0x40
     674:	83 f8 00             	cmp    $0x0,%eax
     677:	7d 1a                	jge    693 <ok_wait>
     679:	83 f8 80             	cmp    $0xffffff80,%eax
     67c:	7c 15                	jl     693 <ok_wait>
     67e:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     685:	00 00 00 
     688:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     68e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000693 <ok_wait>:
     693:	c3                   	ret    

00000694 <pipe>:
SYSCALL(pipe)
     694:	b8 04 00 00 00       	mov    $0x4,%eax
     699:	cd 40                	int    $0x40
     69b:	83 f8 00             	cmp    $0x0,%eax
     69e:	7d 1a                	jge    6ba <ok_pipe>
     6a0:	83 f8 80             	cmp    $0xffffff80,%eax
     6a3:	7c 15                	jl     6ba <ok_pipe>
     6a5:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     6ac:	00 00 00 
     6af:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     6b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000006ba <ok_pipe>:
     6ba:	c3                   	ret    

000006bb <read>:
SYSCALL(read)
     6bb:	b8 05 00 00 00       	mov    $0x5,%eax
     6c0:	cd 40                	int    $0x40
     6c2:	83 f8 00             	cmp    $0x0,%eax
     6c5:	7d 1a                	jge    6e1 <ok_read>
     6c7:	83 f8 80             	cmp    $0xffffff80,%eax
     6ca:	7c 15                	jl     6e1 <ok_read>
     6cc:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     6d3:	00 00 00 
     6d6:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     6dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000006e1 <ok_read>:
     6e1:	c3                   	ret    

000006e2 <write>:
SYSCALL(write)
     6e2:	b8 10 00 00 00       	mov    $0x10,%eax
     6e7:	cd 40                	int    $0x40
     6e9:	83 f8 00             	cmp    $0x0,%eax
     6ec:	7d 1a                	jge    708 <ok_write>
     6ee:	83 f8 80             	cmp    $0xffffff80,%eax
     6f1:	7c 15                	jl     708 <ok_write>
     6f3:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     6fa:	00 00 00 
     6fd:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     703:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000708 <ok_write>:
     708:	c3                   	ret    

00000709 <close>:
SYSCALL(close)
     709:	b8 15 00 00 00       	mov    $0x15,%eax
     70e:	cd 40                	int    $0x40
     710:	83 f8 00             	cmp    $0x0,%eax
     713:	7d 1a                	jge    72f <ok_close>
     715:	83 f8 80             	cmp    $0xffffff80,%eax
     718:	7c 15                	jl     72f <ok_close>
     71a:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     721:	00 00 00 
     724:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     72a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000072f <ok_close>:
     72f:	c3                   	ret    

00000730 <kill>:
SYSCALL(kill)
     730:	b8 06 00 00 00       	mov    $0x6,%eax
     735:	cd 40                	int    $0x40
     737:	83 f8 00             	cmp    $0x0,%eax
     73a:	7d 1a                	jge    756 <ok_kill>
     73c:	83 f8 80             	cmp    $0xffffff80,%eax
     73f:	7c 15                	jl     756 <ok_kill>
     741:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     748:	00 00 00 
     74b:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     751:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000756 <ok_kill>:
     756:	c3                   	ret    

00000757 <execve>:
SYSCALL(execve)
     757:	b8 07 00 00 00       	mov    $0x7,%eax
     75c:	cd 40                	int    $0x40
     75e:	83 f8 00             	cmp    $0x0,%eax
     761:	7d 1a                	jge    77d <ok_execve>
     763:	83 f8 80             	cmp    $0xffffff80,%eax
     766:	7c 15                	jl     77d <ok_execve>
     768:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     76f:	00 00 00 
     772:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     778:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000077d <ok_execve>:
     77d:	c3                   	ret    

0000077e <open>:
SYSCALL(open)
     77e:	b8 0f 00 00 00       	mov    $0xf,%eax
     783:	cd 40                	int    $0x40
     785:	83 f8 00             	cmp    $0x0,%eax
     788:	7d 1a                	jge    7a4 <ok_open>
     78a:	83 f8 80             	cmp    $0xffffff80,%eax
     78d:	7c 15                	jl     7a4 <ok_open>
     78f:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     796:	00 00 00 
     799:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     79f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000007a4 <ok_open>:
     7a4:	c3                   	ret    

000007a5 <mknod>:
SYSCALL(mknod)
     7a5:	b8 11 00 00 00       	mov    $0x11,%eax
     7aa:	cd 40                	int    $0x40
     7ac:	83 f8 00             	cmp    $0x0,%eax
     7af:	7d 1a                	jge    7cb <ok_mknod>
     7b1:	83 f8 80             	cmp    $0xffffff80,%eax
     7b4:	7c 15                	jl     7cb <ok_mknod>
     7b6:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     7bd:	00 00 00 
     7c0:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     7c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000007cb <ok_mknod>:
     7cb:	c3                   	ret    

000007cc <mkfifo>:
SYSCALL(mkfifo)
     7cc:	b8 16 00 00 00       	mov    $0x16,%eax
     7d1:	cd 40                	int    $0x40
     7d3:	83 f8 00             	cmp    $0x0,%eax
     7d6:	7d 1a                	jge    7f2 <ok_mkfifo>
     7d8:	83 f8 80             	cmp    $0xffffff80,%eax
     7db:	7c 15                	jl     7f2 <ok_mkfifo>
     7dd:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     7e4:	00 00 00 
     7e7:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     7ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000007f2 <ok_mkfifo>:
     7f2:	c3                   	ret    

000007f3 <unlink>:
SYSCALL(unlink)
     7f3:	b8 12 00 00 00       	mov    $0x12,%eax
     7f8:	cd 40                	int    $0x40
     7fa:	83 f8 00             	cmp    $0x0,%eax
     7fd:	7d 1a                	jge    819 <ok_unlink>
     7ff:	83 f8 80             	cmp    $0xffffff80,%eax
     802:	7c 15                	jl     819 <ok_unlink>
     804:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     80b:	00 00 00 
     80e:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     814:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000819 <ok_unlink>:
     819:	c3                   	ret    

0000081a <fstat>:
SYSCALL(fstat)
     81a:	b8 08 00 00 00       	mov    $0x8,%eax
     81f:	cd 40                	int    $0x40
     821:	83 f8 00             	cmp    $0x0,%eax
     824:	7d 1a                	jge    840 <ok_fstat>
     826:	83 f8 80             	cmp    $0xffffff80,%eax
     829:	7c 15                	jl     840 <ok_fstat>
     82b:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     832:	00 00 00 
     835:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     83b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000840 <ok_fstat>:
     840:	c3                   	ret    

00000841 <link>:
SYSCALL(link)
     841:	b8 13 00 00 00       	mov    $0x13,%eax
     846:	cd 40                	int    $0x40
     848:	83 f8 00             	cmp    $0x0,%eax
     84b:	7d 1a                	jge    867 <ok_link>
     84d:	83 f8 80             	cmp    $0xffffff80,%eax
     850:	7c 15                	jl     867 <ok_link>
     852:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     859:	00 00 00 
     85c:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     862:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000867 <ok_link>:
     867:	c3                   	ret    

00000868 <mkdir>:
SYSCALL(mkdir)
     868:	b8 14 00 00 00       	mov    $0x14,%eax
     86d:	cd 40                	int    $0x40
     86f:	83 f8 00             	cmp    $0x0,%eax
     872:	7d 1a                	jge    88e <ok_mkdir>
     874:	83 f8 80             	cmp    $0xffffff80,%eax
     877:	7c 15                	jl     88e <ok_mkdir>
     879:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     880:	00 00 00 
     883:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     889:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000088e <ok_mkdir>:
     88e:	c3                   	ret    

0000088f <chdir>:
SYSCALL(chdir)
     88f:	b8 09 00 00 00       	mov    $0x9,%eax
     894:	cd 40                	int    $0x40
     896:	83 f8 00             	cmp    $0x0,%eax
     899:	7d 1a                	jge    8b5 <ok_chdir>
     89b:	83 f8 80             	cmp    $0xffffff80,%eax
     89e:	7c 15                	jl     8b5 <ok_chdir>
     8a0:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     8a7:	00 00 00 
     8aa:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     8b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000008b5 <ok_chdir>:
     8b5:	c3                   	ret    

000008b6 <dup>:
SYSCALL(dup)
     8b6:	b8 0a 00 00 00       	mov    $0xa,%eax
     8bb:	cd 40                	int    $0x40
     8bd:	83 f8 00             	cmp    $0x0,%eax
     8c0:	7d 1a                	jge    8dc <ok_dup>
     8c2:	83 f8 80             	cmp    $0xffffff80,%eax
     8c5:	7c 15                	jl     8dc <ok_dup>
     8c7:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     8ce:	00 00 00 
     8d1:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     8d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000008dc <ok_dup>:
     8dc:	c3                   	ret    

000008dd <getpid>:
SYSCALL(getpid)
     8dd:	b8 0b 00 00 00       	mov    $0xb,%eax
     8e2:	cd 40                	int    $0x40
     8e4:	83 f8 00             	cmp    $0x0,%eax
     8e7:	7d 1a                	jge    903 <ok_getpid>
     8e9:	83 f8 80             	cmp    $0xffffff80,%eax
     8ec:	7c 15                	jl     903 <ok_getpid>
     8ee:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     8f5:	00 00 00 
     8f8:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     8fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000903 <ok_getpid>:
     903:	c3                   	ret    

00000904 <sbrk>:
SYSCALL(sbrk)
     904:	b8 0c 00 00 00       	mov    $0xc,%eax
     909:	cd 40                	int    $0x40
     90b:	83 f8 00             	cmp    $0x0,%eax
     90e:	7d 1a                	jge    92a <ok_sbrk>
     910:	83 f8 80             	cmp    $0xffffff80,%eax
     913:	7c 15                	jl     92a <ok_sbrk>
     915:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     91c:	00 00 00 
     91f:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     925:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000092a <ok_sbrk>:
     92a:	c3                   	ret    

0000092b <sleep>:
SYSCALL(sleep)
     92b:	b8 0d 00 00 00       	mov    $0xd,%eax
     930:	cd 40                	int    $0x40
     932:	83 f8 00             	cmp    $0x0,%eax
     935:	7d 1a                	jge    951 <ok_sleep>
     937:	83 f8 80             	cmp    $0xffffff80,%eax
     93a:	7c 15                	jl     951 <ok_sleep>
     93c:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     943:	00 00 00 
     946:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     94c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000951 <ok_sleep>:
     951:	c3                   	ret    

00000952 <uptime>:
SYSCALL(uptime)
     952:	b8 0e 00 00 00       	mov    $0xe,%eax
     957:	cd 40                	int    $0x40
     959:	83 f8 00             	cmp    $0x0,%eax
     95c:	7d 1a                	jge    978 <ok_uptime>
     95e:	83 f8 80             	cmp    $0xffffff80,%eax
     961:	7c 15                	jl     978 <ok_uptime>
     963:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     96a:	00 00 00 
     96d:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     973:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000978 <ok_uptime>:
     978:	c3                   	ret    

00000979 <umask>:
SYSCALL(umask)
     979:	b8 17 00 00 00       	mov    $0x17,%eax
     97e:	cd 40                	int    $0x40
     980:	83 f8 00             	cmp    $0x0,%eax
     983:	7d 1a                	jge    99f <ok_umask>
     985:	83 f8 80             	cmp    $0xffffff80,%eax
     988:	7c 15                	jl     99f <ok_umask>
     98a:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     991:	00 00 00 
     994:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     99a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

0000099f <ok_umask>:
     99f:	c3                   	ret    

000009a0 <setreuid>:
SYSCALL(setreuid)
     9a0:	b8 18 00 00 00       	mov    $0x18,%eax
     9a5:	cd 40                	int    $0x40
     9a7:	83 f8 00             	cmp    $0x0,%eax
     9aa:	7d 1a                	jge    9c6 <ok_setreuid>
     9ac:	83 f8 80             	cmp    $0xffffff80,%eax
     9af:	7c 15                	jl     9c6 <ok_setreuid>
     9b1:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     9b8:	00 00 00 
     9bb:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     9c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000009c6 <ok_setreuid>:
     9c6:	c3                   	ret    

000009c7 <setregid>:
SYSCALL(setregid)
     9c7:	b8 19 00 00 00       	mov    $0x19,%eax
     9cc:	cd 40                	int    $0x40
     9ce:	83 f8 00             	cmp    $0x0,%eax
     9d1:	7d 1a                	jge    9ed <ok_setregid>
     9d3:	83 f8 80             	cmp    $0xffffff80,%eax
     9d6:	7c 15                	jl     9ed <ok_setregid>
     9d8:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     9df:	00 00 00 
     9e2:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     9e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

000009ed <ok_setregid>:
     9ed:	c3                   	ret    

000009ee <getuid>:
SYSCALL(getuid)
     9ee:	b8 1a 00 00 00       	mov    $0x1a,%eax
     9f3:	cd 40                	int    $0x40
     9f5:	83 f8 00             	cmp    $0x0,%eax
     9f8:	7d 1a                	jge    a14 <ok_getuid>
     9fa:	83 f8 80             	cmp    $0xffffff80,%eax
     9fd:	7c 15                	jl     a14 <ok_getuid>
     9ff:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     a06:	00 00 00 
     a09:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     a0f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a14 <ok_getuid>:
     a14:	c3                   	ret    

00000a15 <geteuid>:
SYSCALL(geteuid)
     a15:	b8 1b 00 00 00       	mov    $0x1b,%eax
     a1a:	cd 40                	int    $0x40
     a1c:	83 f8 00             	cmp    $0x0,%eax
     a1f:	7d 1a                	jge    a3b <ok_geteuid>
     a21:	83 f8 80             	cmp    $0xffffff80,%eax
     a24:	7c 15                	jl     a3b <ok_geteuid>
     a26:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     a2d:	00 00 00 
     a30:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     a36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a3b <ok_geteuid>:
     a3b:	c3                   	ret    

00000a3c <getgid>:
SYSCALL(getgid)
     a3c:	b8 1c 00 00 00       	mov    $0x1c,%eax
     a41:	cd 40                	int    $0x40
     a43:	83 f8 00             	cmp    $0x0,%eax
     a46:	7d 1a                	jge    a62 <ok_getgid>
     a48:	83 f8 80             	cmp    $0xffffff80,%eax
     a4b:	7c 15                	jl     a62 <ok_getgid>
     a4d:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     a54:	00 00 00 
     a57:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     a5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a62 <ok_getgid>:
     a62:	c3                   	ret    

00000a63 <getegid>:
SYSCALL(getegid)
     a63:	b8 1d 00 00 00       	mov    $0x1d,%eax
     a68:	cd 40                	int    $0x40
     a6a:	83 f8 00             	cmp    $0x0,%eax
     a6d:	7d 1a                	jge    a89 <ok_getegid>
     a6f:	83 f8 80             	cmp    $0xffffff80,%eax
     a72:	7c 15                	jl     a89 <ok_getegid>
     a74:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     a7b:	00 00 00 
     a7e:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     a84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000a89 <ok_getegid>:
     a89:	c3                   	ret    

00000a8a <chmod>:
SYSCALL(chmod)
     a8a:	b8 1e 00 00 00       	mov    $0x1e,%eax
     a8f:	cd 40                	int    $0x40
     a91:	83 f8 00             	cmp    $0x0,%eax
     a94:	7d 1a                	jge    ab0 <ok_chmod>
     a96:	83 f8 80             	cmp    $0xffffff80,%eax
     a99:	7c 15                	jl     ab0 <ok_chmod>
     a9b:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     aa2:	00 00 00 
     aa5:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     aab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000ab0 <ok_chmod>:
     ab0:	c3                   	ret    

00000ab1 <chown>:
SYSCALL(chown)
     ab1:	b8 1f 00 00 00       	mov    $0x1f,%eax
     ab6:	cd 40                	int    $0x40
     ab8:	83 f8 00             	cmp    $0x0,%eax
     abb:	7d 1a                	jge    ad7 <ok_chown>
     abd:	83 f8 80             	cmp    $0xffffff80,%eax
     ac0:	7c 15                	jl     ad7 <ok_chown>
     ac2:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     ac9:	00 00 00 
     acc:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     ad2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000ad7 <ok_chown>:
     ad7:	c3                   	ret    

00000ad8 <setgroups>:
SYSCALL(setgroups)
     ad8:	b8 20 00 00 00       	mov    $0x20,%eax
     add:	cd 40                	int    $0x40
     adf:	83 f8 00             	cmp    $0x0,%eax
     ae2:	7d 1a                	jge    afe <ok_setgroups>
     ae4:	83 f8 80             	cmp    $0xffffff80,%eax
     ae7:	7c 15                	jl     afe <ok_setgroups>
     ae9:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     af0:	00 00 00 
     af3:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     af9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000afe <ok_setgroups>:
     afe:	c3                   	ret    

00000aff <getgroups>:
SYSCALL(getgroups)
     aff:	b8 21 00 00 00       	mov    $0x21,%eax
     b04:	cd 40                	int    $0x40
     b06:	83 f8 00             	cmp    $0x0,%eax
     b09:	7d 1a                	jge    b25 <ok_getgroups>
     b0b:	83 f8 80             	cmp    $0xffffff80,%eax
     b0e:	7c 15                	jl     b25 <ok_getgroups>
     b10:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     b17:	00 00 00 
     b1a:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     b20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b25 <ok_getgroups>:
     b25:	c3                   	ret    

00000b26 <clone>:
SYSCALL(clone)
     b26:	b8 22 00 00 00       	mov    $0x22,%eax
     b2b:	cd 40                	int    $0x40
     b2d:	83 f8 00             	cmp    $0x0,%eax
     b30:	7d 1a                	jge    b4c <ok_clone>
     b32:	83 f8 80             	cmp    $0xffffff80,%eax
     b35:	7c 15                	jl     b4c <ok_clone>
     b37:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     b3e:	00 00 00 
     b41:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     b47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b4c <ok_clone>:
     b4c:	c3                   	ret    

00000b4d <exit_group>:
SYSCALL(exit_group)
     b4d:	b8 23 00 00 00       	mov    $0x23,%eax
     b52:	cd 40                	int    $0x40
     b54:	83 f8 00             	cmp    $0x0,%eax
     b57:	7d 1a                	jge    b73 <ok_exit_group>
     b59:	83 f8 80             	cmp    $0xffffff80,%eax
     b5c:	7c 15                	jl     b73 <ok_exit_group>
     b5e:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     b65:	00 00 00 
     b68:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     b6e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b73 <ok_exit_group>:
     b73:	c3                   	ret    

00000b74 <sched_yield>:
SYSCALL(sched_yield)
     b74:	b8 24 00 00 00       	mov    $0x24,%eax
     b79:	cd 40                	int    $0x40
     b7b:	83 f8 00             	cmp    $0x0,%eax
     b7e:	7d 1a                	jge    b9a <ok_sched_yield>
     b80:	83 f8 80             	cmp    $0xffffff80,%eax
     b83:	7c 15                	jl     b9a <ok_sched_yield>
     b85:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     b8c:	00 00 00 
     b8f:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     b95:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000b9a <ok_sched_yield>:
     b9a:	c3                   	ret    

00000b9b <mount>:
SYSCALL(mount)
     b9b:	b8 25 00 00 00       	mov    $0x25,%eax
     ba0:	cd 40                	int    $0x40
     ba2:	83 f8 00             	cmp    $0x0,%eax
     ba5:	7d 1a                	jge    bc1 <ok_mount>
     ba7:	83 f8 80             	cmp    $0xffffff80,%eax
     baa:	7c 15                	jl     bc1 <ok_mount>
     bac:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     bb3:	00 00 00 
     bb6:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     bbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000bc1 <ok_mount>:
     bc1:	c3                   	ret    

00000bc2 <chroot>:
SYSCALL(chroot)
     bc2:	b8 26 00 00 00       	mov    $0x26,%eax
     bc7:	cd 40                	int    $0x40
     bc9:	83 f8 00             	cmp    $0x0,%eax
     bcc:	7d 1a                	jge    be8 <ok_chroot>
     bce:	83 f8 80             	cmp    $0xffffff80,%eax
     bd1:	7c 15                	jl     be8 <ok_chroot>
     bd3:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     bda:	00 00 00 
     bdd:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     be3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000be8 <ok_chroot>:
     be8:	c3                   	ret    

00000be9 <mmap>:
SYSCALL(mmap)
     be9:	b8 27 00 00 00       	mov    $0x27,%eax
     bee:	cd 40                	int    $0x40
     bf0:	83 f8 00             	cmp    $0x0,%eax
     bf3:	7d 1a                	jge    c0f <ok_mmap>
     bf5:	83 f8 80             	cmp    $0xffffff80,%eax
     bf8:	7c 15                	jl     c0f <ok_mmap>
     bfa:	c7 05 e0 15 00 00 00 	movl   $0x0,0x15e0
     c01:	00 00 00 
     c04:	29 05 e0 15 00 00    	sub    %eax,0x15e0
     c0a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

00000c0f <ok_mmap>:
     c0f:	c3                   	ret    

00000c10 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn, int width, char padding_char)
{
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	57                   	push   %edi
     c14:	56                   	push   %esi
     c15:	53                   	push   %ebx
     c16:	83 ec 4c             	sub    $0x4c,%esp
     c19:	89 45 bc             	mov    %eax,-0x44(%ebp)
     c1c:	0f b6 45 10          	movzbl 0x10(%ebp),%eax
     c20:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     c23:	89 d1                	mov    %edx,%ecx
{
     c25:	88 45 ba             	mov    %al,-0x46(%ebp)
  if(sgn && xx < 0){
     c28:	85 d2                	test   %edx,%edx
     c2a:	0f 89 e0 00 00 00    	jns    d10 <printint+0x100>
     c30:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     c34:	0f 84 d6 00 00 00    	je     d10 <printint+0x100>
    neg = 1;
     c3a:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
    x = -xx;
     c41:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     c43:	31 f6                	xor    %esi,%esi
     c45:	8d 7d d7             	lea    -0x29(%ebp),%edi
     c48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c4f:	90                   	nop
  do{
    buf[i++] = digits[x % base];
     c50:	89 c8                	mov    %ecx,%eax
     c52:	31 d2                	xor    %edx,%edx
     c54:	89 75 c0             	mov    %esi,-0x40(%ebp)
     c57:	83 c6 01             	add    $0x1,%esi
     c5a:	f7 75 c4             	divl   -0x3c(%ebp)
     c5d:	89 cb                	mov    %ecx,%ebx
     c5f:	0f b6 92 68 11 00 00 	movzbl 0x1168(%edx),%edx
  }while((x /= base) != 0);
     c66:	89 c1                	mov    %eax,%ecx
    buf[i++] = digits[x % base];
     c68:	88 14 37             	mov    %dl,(%edi,%esi,1)
  }while((x /= base) != 0);
     c6b:	39 5d c4             	cmp    %ebx,-0x3c(%ebp)
     c6e:	76 e0                	jbe    c50 <printint+0x40>
  if(neg)
     c70:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     c73:	8b 5d c0             	mov    -0x40(%ebp),%ebx
     c76:	88 55 bb             	mov    %dl,-0x45(%ebp)
     c79:	85 c0                	test   %eax,%eax
     c7b:	74 10                	je     c8d <printint+0x7d>
    buf[i++] = '-';
     c7d:	c6 45 bb 2d          	movb   $0x2d,-0x45(%ebp)
     c81:	8d 43 02             	lea    0x2(%ebx),%eax
    buf[i++] = digits[x % base];
     c84:	89 f3                	mov    %esi,%ebx
    buf[i++] = '-';
     c86:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
     c8b:	89 c6                	mov    %eax,%esi
  k = width;
  while(--k >= i)
     c8d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c90:	8d 50 ff             	lea    -0x1(%eax),%edx
     c93:	8d 46 ff             	lea    -0x1(%esi),%eax
     c96:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     c99:	39 d6                	cmp    %edx,%esi
     c9b:	0f 8f 7f 00 00 00    	jg     d20 <printint+0x110>
     ca1:	89 5d c0             	mov    %ebx,-0x40(%ebp)
     ca4:	0f b6 5d ba          	movzbl -0x46(%ebp),%ebx
     ca8:	89 d6                	mov    %edx,%esi
     caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     cb0:	83 ec 04             	sub    $0x4,%esp
     cb3:	88 5d d7             	mov    %bl,-0x29(%ebp)
  while(--k >= i)
     cb6:	83 ee 01             	sub    $0x1,%esi
  write(fd, &c, 1);
     cb9:	6a 01                	push   $0x1
     cbb:	57                   	push   %edi
     cbc:	ff 75 bc             	pushl  -0x44(%ebp)
     cbf:	e8 1e fa ff ff       	call   6e2 <write>
  while(--k >= i)
     cc4:	83 c4 10             	add    $0x10,%esp
     cc7:	3b 75 c4             	cmp    -0x3c(%ebp),%esi
     cca:	75 e4                	jne    cb0 <printint+0xa0>
     ccc:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
     cd0:	8b 5d c0             	mov    -0x40(%ebp),%ebx
     cd3:	8b 75 bc             	mov    -0x44(%ebp),%esi
     cd6:	eb 0d                	jmp    ce5 <printint+0xd5>
     cd8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cdf:	90                   	nop
     ce0:	0f b6 44 1d d8       	movzbl -0x28(%ebp,%ebx,1),%eax
  write(fd, &c, 1);
     ce5:	83 ec 04             	sub    $0x4,%esp
    putc(fd, padding_char);

  while(--i >= 0)
     ce8:	83 eb 01             	sub    $0x1,%ebx
     ceb:	88 45 d7             	mov    %al,-0x29(%ebp)
  write(fd, &c, 1);
     cee:	6a 01                	push   $0x1
     cf0:	57                   	push   %edi
     cf1:	56                   	push   %esi
     cf2:	e8 eb f9 ff ff       	call   6e2 <write>
  while(--i >= 0)
     cf7:	83 c4 10             	add    $0x10,%esp
     cfa:	83 fb ff             	cmp    $0xffffffff,%ebx
     cfd:	75 e1                	jne    ce0 <printint+0xd0>
    putc(fd, buf[i]);
}
     cff:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d02:	5b                   	pop    %ebx
     d03:	5e                   	pop    %esi
     d04:	5f                   	pop    %edi
     d05:	5d                   	pop    %ebp
     d06:	c3                   	ret    
     d07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d0e:	66 90                	xchg   %ax,%ax
  neg = 0;
     d10:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
     d17:	e9 27 ff ff ff       	jmp    c43 <printint+0x33>
     d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d20:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
     d24:	8b 75 bc             	mov    -0x44(%ebp),%esi
     d27:	eb bc                	jmp    ce5 <printint+0xd5>
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d30 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     d30:	f3 0f 1e fb          	endbr32 
     d34:	55                   	push   %ebp
     d35:	89 e5                	mov    %esp,%ebp
     d37:	57                   	push   %edi
     d38:	56                   	push   %esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     d39:	8d 75 10             	lea    0x10(%ebp),%esi
{
     d3c:	53                   	push   %ebx
     d3d:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
     d40:	8b 45 0c             	mov    0xc(%ebp),%eax
  ap = (uint*)(void*)&fmt + 1;
     d43:	89 75 c8             	mov    %esi,-0x38(%ebp)
  for(i = 0; fmt[i]; i++){
     d46:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     d49:	0f b6 00             	movzbl (%eax),%eax
     d4c:	84 c0                	test   %al,%al
     d4e:	74 5e                	je     dae <printf+0x7e>
     d50:	31 c9                	xor    %ecx,%ecx
     d52:	31 db                	xor    %ebx,%ebx
     d54:	eb 3b                	jmp    d91 <printf+0x61>
     d56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d5d:	8d 76 00             	lea    0x0(%esi),%esi
     d60:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     d63:	83 fe 25             	cmp    $0x25,%esi
     d66:	74 58                	je     dc0 <printf+0x90>
  write(fd, &c, 1);
     d68:	83 ec 04             	sub    $0x4,%esp
     d6b:	88 45 e7             	mov    %al,-0x19(%ebp)
     d6e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     d71:	6a 01                	push   $0x1
     d73:	50                   	push   %eax
     d74:	ff 75 08             	pushl  0x8(%ebp)
     d77:	89 55 cc             	mov    %edx,-0x34(%ebp)
     d7a:	e8 63 f9 ff ff       	call   6e2 <write>
        state = '%';
      } else {
        putc(fd, c);
     d7f:	8b 55 cc             	mov    -0x34(%ebp),%edx
     d82:	8b 4d d0             	mov    -0x30(%ebp),%ecx
     d85:	83 c4 10             	add    $0x10,%esp
     d88:	89 d3                	mov    %edx,%ebx
  for(i = 0; fmt[i]; i++){
     d8a:	0f b6 07             	movzbl (%edi),%eax
     d8d:	84 c0                	test   %al,%al
     d8f:	74 1d                	je     dae <printf+0x7e>
    c = fmt[i] & 0xff;
     d91:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     d94:	8d 53 01             	lea    0x1(%ebx),%edx
     d97:	0f b6 f0             	movzbl %al,%esi
    if(state == 0){
     d9a:	01 d7                	add    %edx,%edi
     d9c:	85 c9                	test   %ecx,%ecx
     d9e:	74 c0                	je     d60 <printf+0x30>
      }
    } else if(state == '%'){
     da0:	83 f9 25             	cmp    $0x25,%ecx
     da3:	74 2b                	je     dd0 <printf+0xa0>
  for(i = 0; fmt[i]; i++){
     da5:	0f b6 07             	movzbl (%edi),%eax
     da8:	89 d3                	mov    %edx,%ebx
     daa:	84 c0                	test   %al,%al
     dac:	75 e3                	jne    d91 <printf+0x61>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     dae:	8d 65 f4             	lea    -0xc(%ebp),%esp
     db1:	5b                   	pop    %ebx
     db2:	5e                   	pop    %esi
     db3:	5f                   	pop    %edi
     db4:	5d                   	pop    %ebp
     db5:	c3                   	ret    
     db6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dbd:	8d 76 00             	lea    0x0(%esi),%esi
     dc0:	89 d3                	mov    %edx,%ebx
        state = '%';
     dc2:	b9 25 00 00 00       	mov    $0x25,%ecx
     dc7:	eb c1                	jmp    d8a <printf+0x5a>
     dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      char padding_char = ' ';
     dd0:	c6 45 d0 20          	movb   $0x20,-0x30(%ebp)
      if(c == '0'){
     dd4:	83 fe 30             	cmp    $0x30,%esi
     dd7:	0f 84 a3 00 00 00    	je     e80 <printf+0x150>
      while('0' <= c && c <= '9'){
     ddd:	8d 46 d0             	lea    -0x30(%esi),%eax
     de0:	83 f8 09             	cmp    $0x9,%eax
     de3:	0f 87 f9 00 00 00    	ja     ee2 <printf+0x1b2>
      int width = 0;
     de9:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     dec:	31 d2                	xor    %edx,%edx
     dee:	66 90                	xchg   %ax,%ax
        width *= 10;
     df0:	89 d9                	mov    %ebx,%ecx
        i++;
     df2:	83 c3 01             	add    $0x1,%ebx
        width *= 10;
     df5:	8d 14 92             	lea    (%edx,%edx,4),%edx
        c = fmt[i] & 0xff;
     df8:	0f b6 34 1f          	movzbl (%edi,%ebx,1),%esi
        width += c - '0';
     dfc:	8d 14 50             	lea    (%eax,%edx,2),%edx
      while('0' <= c && c <= '9'){
     dff:	8d 46 d0             	lea    -0x30(%esi),%eax
     e02:	83 f8 09             	cmp    $0x9,%eax
     e05:	76 e9                	jbe    df0 <printf+0xc0>
     e07:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     e0a:	8d 59 02             	lea    0x2(%ecx),%ebx
     e0d:	8d 3c 18             	lea    (%eax,%ebx,1),%edi
      if(c == 'd'){
     e10:	83 fe 64             	cmp    $0x64,%esi
     e13:	0f 84 b7 00 00 00    	je     ed0 <printf+0x1a0>
      } else if(c == 'x' || c == 'p'){
     e19:	89 f0                	mov    %esi,%eax
     e1b:	83 e0 f7             	and    $0xfffffff7,%eax
     e1e:	83 f8 70             	cmp    $0x70,%eax
     e21:	74 7d                	je     ea0 <printf+0x170>
      } else if(c == 'o'){
     e23:	83 fe 6f             	cmp    $0x6f,%esi
     e26:	0f 84 bf 00 00 00    	je     eeb <printf+0x1bb>
      } else if(c == 's'){
     e2c:	83 fe 73             	cmp    $0x73,%esi
     e2f:	0f 84 f9 00 00 00    	je     f2e <printf+0x1fe>
      } else if(c == 'c'){
     e35:	83 fe 63             	cmp    $0x63,%esi
     e38:	0f 84 c7 00 00 00    	je     f05 <printf+0x1d5>
      } else if(c == '%'){
     e3e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     e42:	83 fe 25             	cmp    $0x25,%esi
     e45:	0f 84 b2 00 00 00    	je     efd <printf+0x1cd>
  write(fd, &c, 1);
     e4b:	83 ec 04             	sub    $0x4,%esp
     e4e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e51:	6a 01                	push   $0x1
     e53:	50                   	push   %eax
     e54:	ff 75 08             	pushl  0x8(%ebp)
     e57:	e8 86 f8 ff ff       	call   6e2 <write>
        putc(fd, c);
     e5c:	89 f0                	mov    %esi,%eax
  write(fd, &c, 1);
     e5e:	83 c4 0c             	add    $0xc,%esp
        putc(fd, c);
     e61:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     e64:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e67:	6a 01                	push   $0x1
     e69:	50                   	push   %eax
     e6a:	ff 75 08             	pushl  0x8(%ebp)
     e6d:	e8 70 f8 ff ff       	call   6e2 <write>
        putc(fd, c);
     e72:	83 c4 10             	add    $0x10,%esp
      state = 0;
     e75:	31 c9                	xor    %ecx,%ecx
     e77:	e9 0e ff ff ff       	jmp    d8a <printf+0x5a>
     e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        c = fmt[i] & 0xff;
     e80:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     e83:	8d 43 02             	lea    0x2(%ebx),%eax
     e86:	0f b6 37             	movzbl (%edi),%esi
        i++;
     e89:	89 d3                	mov    %edx,%ebx
        padding_char = '0';
     e8b:	c6 45 d0 30          	movb   $0x30,-0x30(%ebp)
        c = fmt[i] & 0xff;
     e8f:	89 c2                	mov    %eax,%edx
     e91:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
     e94:	e9 44 ff ff ff       	jmp    ddd <printf+0xad>
     e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0, width, padding_char);
     ea0:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
     ea4:	83 ec 04             	sub    $0x4,%esp
     ea7:	b9 10 00 00 00       	mov    $0x10,%ecx
     eac:	50                   	push   %eax
     ead:	52                   	push   %edx
     eae:	6a 00                	push   $0x0
        printint(fd, *ap, 8, 0, width, padding_char);
     eb0:	8b 75 c8             	mov    -0x38(%ebp),%esi
     eb3:	8b 45 08             	mov    0x8(%ebp),%eax
     eb6:	8b 16                	mov    (%esi),%edx
     eb8:	e8 53 fd ff ff       	call   c10 <printint>
        ap++;
     ebd:	89 f0                	mov    %esi,%eax
     ebf:	83 c4 10             	add    $0x10,%esp
      state = 0;
     ec2:	31 c9                	xor    %ecx,%ecx
        ap++;
     ec4:	83 c0 04             	add    $0x4,%eax
     ec7:	89 45 c8             	mov    %eax,-0x38(%ebp)
     eca:	e9 bb fe ff ff       	jmp    d8a <printf+0x5a>
     ecf:	90                   	nop
        printint(fd, *ap, 10, 1, width, padding_char);
     ed0:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
     ed4:	83 ec 04             	sub    $0x4,%esp
     ed7:	b9 0a 00 00 00       	mov    $0xa,%ecx
     edc:	50                   	push   %eax
     edd:	52                   	push   %edx
     ede:	6a 01                	push   $0x1
     ee0:	eb ce                	jmp    eb0 <printf+0x180>
      while('0' <= c && c <= '9'){
     ee2:	89 d3                	mov    %edx,%ebx
      int width = 0;
     ee4:	31 d2                	xor    %edx,%edx
     ee6:	e9 25 ff ff ff       	jmp    e10 <printf+0xe0>
        printint(fd, *ap, 8, 0, width, padding_char);
     eeb:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
     eef:	83 ec 04             	sub    $0x4,%esp
     ef2:	b9 08 00 00 00       	mov    $0x8,%ecx
     ef7:	50                   	push   %eax
     ef8:	52                   	push   %edx
     ef9:	6a 00                	push   $0x0
     efb:	eb b3                	jmp    eb0 <printf+0x180>
  write(fd, &c, 1);
     efd:	83 ec 04             	sub    $0x4,%esp
     f00:	e9 5f ff ff ff       	jmp    e64 <printf+0x134>
        putc(fd, *ap);
     f05:	8b 75 c8             	mov    -0x38(%ebp),%esi
  write(fd, &c, 1);
     f08:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     f0b:	8b 06                	mov    (%esi),%eax
  write(fd, &c, 1);
     f0d:	6a 01                	push   $0x1
        ap++;
     f0f:	83 c6 04             	add    $0x4,%esi
        putc(fd, *ap);
     f12:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
     f15:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f18:	50                   	push   %eax
     f19:	ff 75 08             	pushl  0x8(%ebp)
     f1c:	e8 c1 f7 ff ff       	call   6e2 <write>
        ap++;
     f21:	89 75 c8             	mov    %esi,-0x38(%ebp)
     f24:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f27:	31 c9                	xor    %ecx,%ecx
     f29:	e9 5c fe ff ff       	jmp    d8a <printf+0x5a>
        s = (char*)*ap;
     f2e:	8b 45 c8             	mov    -0x38(%ebp),%eax
     f31:	8b 30                	mov    (%eax),%esi
        ap++;
     f33:	83 c0 04             	add    $0x4,%eax
     f36:	89 45 c8             	mov    %eax,-0x38(%ebp)
        if(s == 0)
     f39:	85 f6                	test   %esi,%esi
     f3b:	74 44                	je     f81 <printf+0x251>
        while(*s != 0){
     f3d:	0f b6 06             	movzbl (%esi),%eax
      state = 0;
     f40:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
     f42:	84 c0                	test   %al,%al
     f44:	0f 84 40 fe ff ff    	je     d8a <printf+0x5a>
     f4a:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     f4d:	89 f3                	mov    %esi,%ebx
     f4f:	8b 75 08             	mov    0x8(%ebp),%esi
     f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
     f58:	83 ec 04             	sub    $0x4,%esp
     f5b:	88 45 e7             	mov    %al,-0x19(%ebp)
     f5e:	8d 45 e7             	lea    -0x19(%ebp),%eax
          s++;
     f61:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     f64:	6a 01                	push   $0x1
     f66:	50                   	push   %eax
     f67:	56                   	push   %esi
     f68:	e8 75 f7 ff ff       	call   6e2 <write>
        while(*s != 0){
     f6d:	0f b6 03             	movzbl (%ebx),%eax
     f70:	83 c4 10             	add    $0x10,%esp
     f73:	84 c0                	test   %al,%al
     f75:	75 e1                	jne    f58 <printf+0x228>
     f77:	8b 5d d0             	mov    -0x30(%ebp),%ebx
      state = 0;
     f7a:	31 c9                	xor    %ecx,%ecx
     f7c:	e9 09 fe ff ff       	jmp    d8a <printf+0x5a>
          s = "(null)";
     f81:	be 5e 11 00 00       	mov    $0x115e,%esi
        while(*s != 0){
     f86:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     f89:	b8 28 00 00 00       	mov    $0x28,%eax
     f8e:	89 f3                	mov    %esi,%ebx
     f90:	8b 75 08             	mov    0x8(%ebp),%esi
     f93:	eb c3                	jmp    f58 <printf+0x228>
     f95:	66 90                	xchg   %ax,%ax
     f97:	66 90                	xchg   %ax,%ax
     f99:	66 90                	xchg   %ax,%ax
     f9b:	66 90                	xchg   %ax,%ax
     f9d:	66 90                	xchg   %ax,%ax
     f9f:	90                   	nop

00000fa0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     fa0:	f3 0f 1e fb          	endbr32 
     fa4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fa5:	a1 c4 15 00 00       	mov    0x15c4,%eax
{
     faa:	89 e5                	mov    %esp,%ebp
     fac:	57                   	push   %edi
     fad:	56                   	push   %esi
     fae:	53                   	push   %ebx
     faf:	8b 5d 08             	mov    0x8(%ebp),%ebx
     fb2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
     fb4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fb7:	39 c8                	cmp    %ecx,%eax
     fb9:	73 15                	jae    fd0 <free+0x30>
     fbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fbf:	90                   	nop
     fc0:	39 d1                	cmp    %edx,%ecx
     fc2:	72 14                	jb     fd8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fc4:	39 d0                	cmp    %edx,%eax
     fc6:	73 10                	jae    fd8 <free+0x38>
{
     fc8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fca:	8b 10                	mov    (%eax),%edx
     fcc:	39 c8                	cmp    %ecx,%eax
     fce:	72 f0                	jb     fc0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fd0:	39 d0                	cmp    %edx,%eax
     fd2:	72 f4                	jb     fc8 <free+0x28>
     fd4:	39 d1                	cmp    %edx,%ecx
     fd6:	73 f0                	jae    fc8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
     fd8:	8b 73 fc             	mov    -0x4(%ebx),%esi
     fdb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     fde:	39 fa                	cmp    %edi,%edx
     fe0:	74 1e                	je     1000 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     fe2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     fe5:	8b 50 04             	mov    0x4(%eax),%edx
     fe8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     feb:	39 f1                	cmp    %esi,%ecx
     fed:	74 28                	je     1017 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     fef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
     ff1:	5b                   	pop    %ebx
  freep = p;
     ff2:	a3 c4 15 00 00       	mov    %eax,0x15c4
}
     ff7:	5e                   	pop    %esi
     ff8:	5f                   	pop    %edi
     ff9:	5d                   	pop    %ebp
     ffa:	c3                   	ret    
     ffb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1000:	03 72 04             	add    0x4(%edx),%esi
    1003:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1006:	8b 10                	mov    (%eax),%edx
    1008:	8b 12                	mov    (%edx),%edx
    100a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    100d:	8b 50 04             	mov    0x4(%eax),%edx
    1010:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1013:	39 f1                	cmp    %esi,%ecx
    1015:	75 d8                	jne    fef <free+0x4f>
    p->s.size += bp->s.size;
    1017:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    101a:	a3 c4 15 00 00       	mov    %eax,0x15c4
    p->s.size += bp->s.size;
    101f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1022:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1025:	89 10                	mov    %edx,(%eax)
}
    1027:	5b                   	pop    %ebx
    1028:	5e                   	pop    %esi
    1029:	5f                   	pop    %edi
    102a:	5d                   	pop    %ebp
    102b:	c3                   	ret    
    102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001030 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1030:	f3 0f 1e fb          	endbr32 
    1034:	55                   	push   %ebp
    1035:	89 e5                	mov    %esp,%ebp
    1037:	57                   	push   %edi
    1038:	56                   	push   %esi
    1039:	53                   	push   %ebx
    103a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    103d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1040:	8b 3d c4 15 00 00    	mov    0x15c4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1046:	8d 70 07             	lea    0x7(%eax),%esi
    1049:	c1 ee 03             	shr    $0x3,%esi
    104c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    104f:	85 ff                	test   %edi,%edi
    1051:	0f 84 a9 00 00 00    	je     1100 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1057:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1059:	8b 48 04             	mov    0x4(%eax),%ecx
    105c:	39 f1                	cmp    %esi,%ecx
    105e:	73 6d                	jae    10cd <malloc+0x9d>
    1060:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1066:	bb 00 10 00 00       	mov    $0x1000,%ebx
    106b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    106e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1075:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1078:	eb 17                	jmp    1091 <malloc+0x61>
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1080:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1082:	8b 4a 04             	mov    0x4(%edx),%ecx
    1085:	39 f1                	cmp    %esi,%ecx
    1087:	73 4f                	jae    10d8 <malloc+0xa8>
    1089:	8b 3d c4 15 00 00    	mov    0x15c4,%edi
    108f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1091:	39 c7                	cmp    %eax,%edi
    1093:	75 eb                	jne    1080 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1095:	83 ec 0c             	sub    $0xc,%esp
    1098:	ff 75 e4             	pushl  -0x1c(%ebp)
    109b:	e8 64 f8 ff ff       	call   904 <sbrk>
  if(p == (char*)-1)
    10a0:	83 c4 10             	add    $0x10,%esp
    10a3:	83 f8 ff             	cmp    $0xffffffff,%eax
    10a6:	74 1b                	je     10c3 <malloc+0x93>
  hp->s.size = nu;
    10a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    10ab:	83 ec 0c             	sub    $0xc,%esp
    10ae:	83 c0 08             	add    $0x8,%eax
    10b1:	50                   	push   %eax
    10b2:	e8 e9 fe ff ff       	call   fa0 <free>
  return freep;
    10b7:	a1 c4 15 00 00       	mov    0x15c4,%eax
      if((p = morecore(nunits)) == 0)
    10bc:	83 c4 10             	add    $0x10,%esp
    10bf:	85 c0                	test   %eax,%eax
    10c1:	75 bd                	jne    1080 <malloc+0x50>
        return 0;
  }
}
    10c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    10c6:	31 c0                	xor    %eax,%eax
}
    10c8:	5b                   	pop    %ebx
    10c9:	5e                   	pop    %esi
    10ca:	5f                   	pop    %edi
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
    if(p->s.size >= nunits){
    10cd:	89 c2                	mov    %eax,%edx
    10cf:	89 f8                	mov    %edi,%eax
    10d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    10d8:	39 ce                	cmp    %ecx,%esi
    10da:	74 54                	je     1130 <malloc+0x100>
        p->s.size -= nunits;
    10dc:	29 f1                	sub    %esi,%ecx
    10de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    10e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    10e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    10e7:	a3 c4 15 00 00       	mov    %eax,0x15c4
}
    10ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    10ef:	8d 42 08             	lea    0x8(%edx),%eax
}
    10f2:	5b                   	pop    %ebx
    10f3:	5e                   	pop    %esi
    10f4:	5f                   	pop    %edi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1100:	c7 05 c4 15 00 00 c8 	movl   $0x15c8,0x15c4
    1107:	15 00 00 
    base.s.size = 0;
    110a:	bf c8 15 00 00       	mov    $0x15c8,%edi
    base.s.ptr = freep = prevp = &base;
    110f:	c7 05 c8 15 00 00 c8 	movl   $0x15c8,0x15c8
    1116:	15 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1119:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    111b:	c7 05 cc 15 00 00 00 	movl   $0x0,0x15cc
    1122:	00 00 00 
    if(p->s.size >= nunits){
    1125:	e9 36 ff ff ff       	jmp    1060 <malloc+0x30>
    112a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1130:	8b 0a                	mov    (%edx),%ecx
    1132:	89 08                	mov    %ecx,(%eax)
    1134:	eb b1                	jmp    10e7 <malloc+0xb7>
