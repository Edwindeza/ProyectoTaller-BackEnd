# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-07-07 18:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webapp', '0007_user_is_admin'),
    ]

    operations = [
        migrations.AddField(
            model_name='requisito',
            name='monto',
            field=models.CharField(blank=True, max_length=10, null=True),
        ),
        migrations.AlterField(
            model_name='requisito',
            name='concepto_de_pago',
            field=models.CharField(blank=True, max_length=7, null=True),
        ),
    ]
