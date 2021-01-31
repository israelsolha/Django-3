from django.shortcuts import render
from django.http import HttpResponse
import random
from string import ascii_letters, digits, ascii_lowercase, punctuation


def home(request):
    return render(request, 'generator/home.html', {'best_member': '박 채영'})


def password(request):

    response = dict()
    for value in ['length', 'uppercase', 'numbers', 'special']:
        val = request.GET.get(value)
        response[value] = val if val != 'on' and val else True if val else False
    character_set = ascii_lowercase if not response['uppercase'] else ascii_letters
    if response['numbers']:
        character_set += digits
    if response['special']:
        # character_set += punctuation
        character_set += '!@#$%&*_'

    final_password = ''.join(random.choices(
        character_set, k=int(response['length'])))
    return render(request, 'generator/password.html', {'password': final_password})
