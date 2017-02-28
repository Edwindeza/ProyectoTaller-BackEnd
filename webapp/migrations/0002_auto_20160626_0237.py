# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-06-26 07:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='tramite',
            options={'ordering': ('visita',)},
        ),
        migrations.AddField(
            model_name='tramite',
            name='visita',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='user',
            name='first_name',
            field=models.CharField(max_length=100, verbose_name='nombres'),
        ),
        migrations.AlterField(
            model_name='user',
            name='last_name',
            field=models.CharField(max_length=100, verbose_name='apellidos'),
        ),
    ]