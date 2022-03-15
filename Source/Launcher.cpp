/* ==================================== |
| SpaccCraft.Run One-click Launcher     |
| Copyright (C) 2022, OctoSpacc (GPLv3) |
| ==================================== */
#include <stdio.h>
#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Input.H>
#include <FL/Fl_Button.H>

Fl_Input *input[1];

void WriteUsername(const char* Username) {
	FILE *UsernameFile;
	UsernameFile = fopen("Username.txt", "w");
	if (!UsernameFile) {
		printf("Error: Username not saved.\n");
	} else {
		printf("Username (%s) saved!\n", input[0]->value());
		fprintf(UsernameFile, Username);
		fclose(UsernameFile);
	}
}

void RunGame(const char* Username) {
	printf("Starting game with Username %s\n..", Username);
	#ifdef _WIN32
		system("GameBoot.cmd");
	#else
		system("./GameBoot.sh");
	#endif
}

void PlayClicked(Fl_Widget *, void *) {
	if (input[0]->size() > 0) {
		WriteUsername(input[0]->value());
		RunGame(input[0]->value());
	} else {
		printf("Error: Invalid Username!\n");
	}
}

int ShowGUI(int argc, char **argv) {
	Fl::args(argc, argv);
	Fl::get_system_colors();
	Fl_Window *window = new Fl_Window(320,160);

	Fl_Box *box = new Fl_Box(96,16,128,24,"Enter your SpaccCraft Username below");

	int y = 64;
	input[0] = new Fl_Input(100,y,192,32,"Username:"); y += 48;
	input[0]->tooltip("Minecraft Username");
	input[0]->maximum_size(31);

	Fl_Button *b;
	b = new Fl_Button(16,y,288,32,"Play!");
	b->callback(PlayClicked);

	window->end();
	window->show(argc, argv);
	return Fl::run();
}

int main(int argc, char **argv) {
	int ConfigCalled = 0;

	for (int i=1; i<argc; i++) {
		if (strcmp(argv[i], "-Config") == 0) {
			ConfigCalled = 1;
		}
	}

	FILE *UsernameFile;
	char Username[32];
	UsernameFile = fopen("Username.txt","r");
	if (!UsernameFile) {
		printf("Can't read last username, opening GUI config..\n");
		ConfigCalled = 1;
	} else {
		while (fgets(Username, 32, UsernameFile) != NULL) {}
		fclose(UsernameFile);
	}

	if (ConfigCalled == 1) {
		ShowGUI(argc,argv);	
	} else if (ConfigCalled == 0) {
		printf("Tip: Use command line option \"-Config\" to reopen configuration GUI.\n");
		RunGame(Username);
	}

	return 0;
}
