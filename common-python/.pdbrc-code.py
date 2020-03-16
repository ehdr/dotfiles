def _ehdr_get_memory_usage():
    import resource
    import sys
    scale = 2**10 if 'linux' in sys.platform else 2**20
    print(f'memory usage in MiB: {resource.getrusage(resource.RUSAGE_SELF).ru_maxrss / scale}')
