#include<iostream>
using namespace std;
int song[20],c[20],n ,i;
class SongLibrary
{
	public:
	int songid;
	string sname,artist,movie;
	int year;
	
	void declare();
	void search();
	void accept();
	void table();
	void update();
	void searchart();
}h[20];

void SongLibrary :: search()
{
	int loc,k;
	cout<<"\n Enter the Song Id : ";
	cin>>k;
	for(i=0;i<n;i++)
	{
		loc = k % n;
		if(h[i].songid == k)
		{
	           cout<<"\n Song Found at : "<<h[i].songid;
	           cout<<"\n    Song ID : \t    Song ";
                   cout<<"\n\t"<<h[i].songid<<"\t\t"<<h[i].sname<<"\t"<<" "<<endl;
		   break;
	        }
	}
	
}

void SongLibrary :: searchart ()
{
	int loc;
	string art;
	cout<<"\n Enter the Artist Name : ";
	cin>>art;
	for(i=0;i<n;i++)
	{
		if(h[i].artist == art)
		{
	           cout<<"\n Artist Found at : "<<h[i].songid;
	           cout<<"\n   Song ID : \t Artist ";
                   cout<<"\n\t "<<h[i].songid<<"\t   "<<h[i].artist<<"\t"<<" "<<endl;
		   break;
		}
	}

}
void SongLibrary :: declare()
{
	cout<<"\n Enter how many Song ID you want to insert : ";
	cin>>n;
	cout<<"\n Enter all your key : ";
	for(i=0;i<n;i++)
	{
		cin>>song[i];
	}
	for(i=0;i<20;i++)
	{
		h[i].songid = -1;
		c[i] = 0;
	}
}

void SongLibrary :: table()
{
	cout<<"\n SONG ID \t Song Name \t Artist Name \t Movie \t   Year \t Chain ";
	for(i=0;i<20;i++)
	{
		cout<<"\n"<<h[i].songid<<"\t\t  "<<h[i].sname<<"\t\t  "<<h[i].artist<<" \t \t"<<h[i].movie<<"\t   "<<h[i].year<<"\t\t  "<<c[i]<<" ";
        }
}

void SongLibrary :: update()
{ 
	int loc,k;
	string nart,newname,nmovie;
	int nyear;
	cout<<"\n Enter song id which information you want to change : ";
	cin>>k;
	for(i=0;i<n;i++)
	{
		loc = k % n;
		if(h[i].songid == k)
		{
		   cout<<"\n Enter New Song Name : ";cin>>newname;
		   cout<<"\n Enter New Artist name : ";cin>>nart;
		   cout<<"\n Enter New Movie / Album name : ";cin>>nmovie;
		   cout<<"\n Enter New Year : ";cin>>nyear;
		   
		   h[i].sname=newname;
		   h[i].artist=nart;
		   h[i].movie=nmovie;
		   h[i].year=nyear;  
		   	        
		 }
	}
}

void SongLibrary :: accept()
{
	int pos,temp;
	for(i=0;i<n;i++)
	{
		pos=song[i]%10;
		temp = pos;
	
	do{
		if(h[pos].songid == -1)
		{
			h[pos].songid = song[i];
			cout<<"\n Enter the Song id , Song name , Artist name , Movie name , Year : ";
			cin>>h[pos].songid>>h[pos].sname>>h[pos].artist>>h[pos].movie>>h[pos].year;
			break;
		}
		else
		{   pos++;
		
			c[temp] = pos;
			
			if(pos>n)
			{
				pos=0;

			}
		}
	}while(pos<20);
}
}
int main()
{
	SongLibrary s;
	s.declare();
	int ch; 
	     do
	     {
	cout<<"\n1.Insert Song  \n2.Show Song Table  \n3.Update Song Info \n4.Search Song   \n5.Search Artist  \n0. Exit \n";
	cout<<"Enter Your Choice : ";
	cin>>ch;
      
	switch(ch)
	{
	case 0: cout<<"------------------  T H A N K   Y O U   -----------------";
		break;
	case 1: s.accept();
		break;
	case 2: s.table();
		break;
	case 3: s.update();
		break;
	case 4:	s.search();
		break;
	case 5: s.searchart();
		break;
	default: cout<<"\n Not Found ... ";
		break;
	}
  }while(ch!=0);
	return 0;
}
