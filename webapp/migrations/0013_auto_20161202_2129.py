# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-12-03 02:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webapp', '0012_auto_20161202_2123'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuariotramite',
            name='anexos',
        ),
        migrations.AddField(
            model_name='usuariotramite',
            name='boucher',
            field=models.FileField(blank=True, null=True, upload_to='documents'),
        ),
        migrations.DeleteModel(
            name='Anexo',
        ),
    ]
