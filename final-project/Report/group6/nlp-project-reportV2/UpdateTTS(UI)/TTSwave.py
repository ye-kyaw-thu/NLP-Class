# Importing Required Modules & libraries
from tkinter import *
from PIL import ImageTk,Image
import pygame
import os
from tkinter import filedialog

# Defining MusicPlayer Class
class MusicPlayer:

  # Defining Constructor
  def __init__(self,root):
    self.root = root
    # Title of the window
    self.root.title("Myanmar Text to Speech")
    # Window Geometry
    #self.root.geometry("1000x200+200+200")
    self.root.geometry("1010x510")
    self.root.resizable(0, 0)
    self.root.configure(background="green")
     
    # Initiating Pygame
    pygame.init()
    # Initiating Pygame Mixer
    pygame.mixer.init()
    # Declaring track Variable
    self.track = StringVar()
    self.track1 = StringVar()
    # Declaring Status Variable
    self.status = StringVar()
    #image1 = PhotoImage(file = "images1.png")
    #label_for_image= Label(self.root, image=image1,width=1010, height=500)
    #label_for_image.pack()
    trackframe = LabelFrame(self.root,text="Song Track",font=("times new roman",15,"bold"),bg="lightgreen",fg="blue", relief=GROOVE)
    trackframe.place(x=0,y=0,width=580,height=200)
    # Inserting Song Track Label
    songtrack = Label(trackframe,textvariable=self.track,width=20,font=("times new roman",24,"bold"),bg="lightgreen", fg="blue").grid(row=0,column=0,padx=10,pady=5)
    
    # Inserting Status Label
    #trackstatus = Label(trackframe,textvariable=self.status,font=("times new roman",24,"bold"),bg="blue",fg="gold").grid(row=0,column=1,padx=10,pady=5)

    # Creating Track Frame for Song label & status label
   # trackframe = LabelFrame(self.root,text="Wave Track",font=("times new roman",15,"bold"),bd=5,relief=GROOVE)
   # trackframe.place(x=0,y=0,width=600,height=200)
    # Inserting Song Track Label
   # photo=PhotoImage(file="animated-sound-waves.gif")
   # songtrack = Label(trackframe,image=photo,text="Place to put the positive comments").grid(row=2,column=2,padx=10,pady=5)
  #  c1 = ImageTk.PhotoImage(Image.open("animated-sound-waves.gif"))
   



#img.image=render
    #img.place(x=0,y=0)
    #img=ImageTk.PhotoImage(Image.open("animated-sound-waves.gif"))
    #songtrack = Label(trackframe,textvariable=self.img)
     #label = Label(f, image = img, *args, **kwargs)
    # Inserting Status Label
    #trackstatus = Label(trackframe,textvariable=self.status,font=("times new roman",24,"bold")).grid(row=0,column=1,padx=10,pady=5)

    # Creating Button Frame
    buttonframe = LabelFrame(self.root,text="Control Panel",font=("times new roman",15,"bold"),bg="lightgreen", bd=5,relief=GROOVE,fg="blue")
    buttonframe.place(x=1,y=220,width=580,height=100)
    # Inserting Play Button
    playbtn = Button(buttonframe,text="PLAY",command=self.playsong,width=6,height=1,font=("times new roman",16,"bold"), bg="white",bd=4,activebackground="skyblue", activeforeground="gray").grid(row=0,column=2,padx=10,pady=5)
    #playbtn.place(x=300,y=250,width=100,height=30)
    # Inserting Pause Button
    playbtn = Button(buttonframe,text="PAUSE",command=self.pausesong,width=8,height=1,font=("times new roman",16,"bold"),bg="white",bd=4,activebackground="skyblue", activeforeground="gray").grid(row=0,column=3,padx=10,pady=5)
    #playbtn.place(x=450,y=250,width=100,height=30)
    # Inserting Unpause Button
   # playbtn = Button(buttonframe,text="UNPAUSE",command=self.unpausesong,width=10,height=1,font=("times new roman",16,"bold"),fg="navymagenta",bg="gold").grid(row=0,column=2,padx=10,pady=5)
    # Inserting Stop Button
    playbtn = Button(buttonframe,text="STOP",command=self.stopsong,width=6,height=1,font=("times new roman",16,"bold"),bg="white",bd=4,activebackground="skyblue", activeforeground="gray").grid(row=0,column=4,padx=10,pady=5)
    #playbtn.place(x=600,y=250,width=100,height=30)
    

   #Creating Button Frame
    testingframe = LabelFrame(self.root,text="Testing Waves",font=("times new roman",15,"bold"),bg="lightgreen", bd=5,relief=GROOVE, fg="blue")
    testingframe.place(x=600,y=220,width=400,height=100)
    # Load Button
    playbtn = Button(testingframe,text="Testing Wave",command=self.load,width=10,height=1,font=("times new roman",16,"bold"),bg="white",bd=4,activebackground="skyblue", activeforeground="gray").grid(row=0,column=6,padx=10,pady=5)
    #playbtn.place(x=750,y=250,width=100,height=30)

    # Load play Button
    playbtn = Button(testingframe,text="Play",command=self.loadplay,width=6,height=1,font=("times new roman",16,"bold"),bg="white",bd=5,activebackground="skyblue", activeforeground="gray").grid(row=0,column=7,padx=10,pady=5)
    #playbtn.place(x=900,y=250,width=100,height=30)


    # Creating Playlist Frame
    songsframe = LabelFrame(self.root,text="Training Waves",font=("times new roman",15,"bold"),bg="lightgreen", bd=5,relief=GROOVE,fg="blue")
    songsframe.place(x=600,y=0,width=400,height=200)
    # Inserting scrollbar
    scrol_y = Scrollbar(songsframe,orient=VERTICAL)
    # Inserting Playlist listbox
    self.playlist = Listbox(songsframe,yscrollcommand=scrol_y.set,selectbackground="blue",selectmode=SINGLE,font=("times new roman",13,"bold"),bd=5,fg="green",relief=GROOVE)
    # Applying Scrollbar to listbox
    scrol_y.pack(side=RIGHT,fill=Y)
    scrol_y.config(command=self.playlist.yview)
    self.playlist.pack(fill=BOTH)
    # Changing Directory for fetching Songs
    #dir_ =  filedialog.askdirectory(initialdir='/home/miit/Downloads/TTSProject/wav/Training:\\',title='Select Directory')
    #os.chdir(dir_)
    path1='/home/miit/thida_san/project/UpdateTTS(UI)/wav'
    os.chdir(path1)
    #os.chdir("/home/miit/Downloads/TTSProject/wav/Training")
    os.getcwd()
    # Fetching Songs
    songtracks = os.listdir()
    # Inserting Songs into Playlist
    for track in songtracks:
      self.playlist.insert(END,track)    
    # Fetching Songs
    songtracks_t = os.listdir()
    # Inserting Songs into Playlist
    for track1 in songtracks_t:
      self.playlist.insert(END,track1)
    
    #member  
    member = Label(self.root, text="Group Members", font=("times new roman",12,"bold"),fg="blue")
    member.place(x=490,y=350)
    memberlist = Text(self.root, height=10, width=30,font=("times new roman",12,"bold"),fg="blue")
    memberlist.pack()
    memberlist.insert(END, "Badounmar         Ph.D(IT)-18 \nNan Yu Hlaing    Ph.D(IT)-16\nHnin Yu Hlaing  Ph.D(IT)-10\nThida San            Ph.D(IT)-12\nHlaing May Tin   Ph.D(IT)-6\nZun Hlaing Moe  Ph.D(IT)-17")
    memberlist.place(x=425,y=380)

  # Defining Play Song Function
  def playsong(self):
    # Displaying Selected Song title
    self.track.set(self.playlist.get(ACTIVE))
    #self.track1.set(self.playlist.get(ACTIVE))
    # Displaying Status
    #self.status.set("Play")
    # Loading Selected Song
    pygame.mixer.music.load(self.playlist.get(ACTIVE))
    # Playing Selected Song
    pygame.mixer.music.play()
  
  def stopsong(self):
    # Displaying Status
    self.status.set("Stopp")
    # Stopped Song
    pygame.mixer.music.stop()

  def pausesong(self):
    # Displaying Status
    #self.status.set("Pause")
    # Paused Song
   # pygame.mixer.music.pause()
   
#def pause(self):
        if not self.playing_state:
            pygame.mixer.music.pause()
            self.playing_state=True
        else:
            pygame.mixer.music.unpause()
            self.playing_state = False

  #def unpausesong(self):
    # Displaying Status
   # self.status.set("-Playing")
    # Playing back Song
   # pygame.mixer.music.unpause()
  def load(self):
        self.music_file = filedialog.askopenfilename()
  
  def loadplay(self):
      if self.music_file:
          pygame.mixer.init()
          pygame.mixer.music.load(self.music_file)
          pygame.mixer.music.play()
# Creating TK Container
root = Tk()
# Passing Root to MusicPlayer Class
MusicPlayer(root)
# Root Window Looping
root.mainloop()
