#include <SDL.h>
#include <SDL_thread.h>
#include <SDL_mutex.h>
#include <stdlib.h>
/*
 * Arg1 : with lock/unlock = 1 without = 0
 * Arg2 : Number of iterations
 */
int main(int argc, char *argv[])
{
	if(argc <= 2)
	{
		fprintf(stderr, "You must specify a number of iterations\n");
		exit(-1);
	}

	SDL_mutex *mutex = SDL_CreateMutex();
	int lock = atoi(argv[1]);
	long long int num_iter = atoi(argv[1]);

	for(int i = 0; i < num_iter; ++i)
	{
		if(lock)
		{
			SDL_LockMutex(mutex);
			SDL_UnlockMutex(mutex);
		}
	}
	return 0;
}
